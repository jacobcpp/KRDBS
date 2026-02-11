-- show number of cars owned by make
select v.make, count(v.vehicle_id) as number_owned from vehicles v group by v.make

-- show number of cars owned by make - only if i own more then 10 of given make
select v.make, count(v.vehicle_id) as number_owned from vehicles v group by v.make having count(vehicle_id) > 10

-- select cars newer then 2020
select * from vehicles where vehicles.year > 2020

select * from vehicles v order by v.year --desc


-- 2.a - select 1
select avg(reltuples) -- reltuples is system estimate of row count - not exact, used by query planner for optimizations
from pg_class c -- pg_class is system catalog table
join pg_namespace n on n.oid = c.relnamespace -- has to be joined in order to determine which schema tables belong to(filter by schema 2 lines below)
where c.relkind = 'r' -- relkind r means normal table(not index, view, ...)
and n.nspname = 'public' -- filter out all system tables and only get tables i want

--select * from pg_namespace;
--select * from pg_class;
--select * from pg_class c
--join pg_namespace n on n.oid = c.relnamespace;

--2.a - select 2
select 	make,
	   	model,
		(select t.type_name 
		from vehicletypes t 
		where v.vehicle_type = t.vehicle_type_id) 
from vehicles v;

-- 2.a - select 3
-- vehicle number and manufacture year by make
select make, 
COUNT(v.vehicle_id) as number_of_vehicles,
ROUND(AVG(v."year" ),0) as avg_vehicle_manufacture_year
from
vehicles v
group by v.make 

-- recursive select
create table employees(
id serial primary key,
name varchar(50) not null,
manager_id int references employees(id)
);

insert into employees(name, manager_id) values
('Alice', NULL),
('Bob', 1),
('Charlie', 1),
('David', 2),
('Eve', 2),      
('Frank', 3);

-- all employees under bob
with recursive subordinates as (
	select id, name, manager_id
	from employees
	where id=2
	
	union all
	
	select e.id, e.name, e.manager_id
	from employees e
	inner join subordinates s on e.manager_id = s.id
	)
select * from subordinates;

-- entire employee hierarchy
with recursive "Rekurze" as(
select 1 as n, e.id,e.name,e.manager_id 
from employees as e
where e.manager_id is null

union all

select n+1, e.id, e.name, e.manager_id 
from employees as e
join "Rekurze" as r on e.manager_id = r.id
) select * from "Rekurze";


-- 2.c -- index 
create unique index index_customer_unique_email
on Customers (lower(email));

create index index_make_model_fulltext
on Vehicles
using GIN(
to_tsvector('english', make || ' ' || model)); -- to_tsvector converts text string into special data type optimized for text search

-- selects only skoda octavia vehicles using fulltext search
select * from vehicles v 
where to_tsvector('english', make || ' ' || model) @@ to_tsquery('english', 'skoda & octavia')

-- 2.d - FUNCTION
create function total_maintenance_cost()
returns numeric as $$
declare
	total numeric;
begin
	select sum(cost) into total 
	from maintenancerecords;

	return total;
end;
$$ language plpgsql;

select total_maintenance_cost()

-- 2.e - PROCEDURE

create or replace procedure create_discount_on_old_vehicles()
language plpgsql as $$
declare
	cur cursor for
		select vehicle_id, year from vehicles;

	v_vehicle_id int;
	v_year int;
	v_discount numeric;
begin
	drop table if exists vehicle_discounts;

	create table vehicle_discounts(
	vehicle_id int primary key,
	discount_percent numeric
	);

	open cur;
	
	loop
		fetch cur into v_vehicle_id, v_year;
		exit when not found;

		v_discount := case
			when extract(year from current_date) - v_year >= 10 then 20 -- vehicles older then 10y get 20% discount
			when extract(year from current_date) - v_year >= 5 then 10 -- vehicles older then 5y get 10% discount
			else null
		end;
	
	insert into vehicle_discounts(vehicle_id, discount_percent)
	values(v_vehicle_id, v_discount);
	
end loop;
close cur;

exception
	when others then
		raise notice 'Error creating vehicle discounts: %', sqlerrm;
end;
$$;

-- call the procedure
call create_discount_on_old_vehicles();

select make,model,year,vd.discount_percent 
from vehicles v 
join vehicle_discounts vd on vd.vehicle_id = v.vehicle_id;

-- 2.f - TRIGGER
-- create audit table
drop table vehicle_discounts_audit;
create table vehicle_discounts_audit(
audit_id serial primary key,
vehicle_id int,
old_discount numeric,
new_discount numeric,
operation varchar(10), -- INSERT or UPDATE or ERROR
err text default null,
performed_at timestamp default current_timestamp);

-- create trigger function
create or replace function update_discount_on_old_vehicles_with_audit()
returns trigger as $$
declare
	discount_value numeric := null;
	old_discount_value numeric := null;
begin
	discount_value := case
		when extract(year from current_date) - new.year >= 10 then 20 -- vehicles older then 10y get 20% discount
		when extract(year from current_date) - new.year >= 5 then 10 -- vehicles older then 5y get 10% discount
		else null
	end;

	begin -- acts as savepoint for this transaction
		-- get old discount if it exists
		select discount_percent into old_discount_value
		from vehicle_discounts
		where vehicle_id = new.vehicle_id;
		
		-- insert or update the discount table
		insert into vehicle_discounts(vehicle_id, discount_percent)
		values(new.vehicle_id, discount_value)
		on conflict(vehicle_id)
		do update set discount_percent = excluded.discount_percent;
		
		-- log to audit table
		insert into vehicle_discounts_audit(vehicle_id, old_discount, new_discount, operation)
		values(new.vehicle_id, old_discount_value, discount_value, TG_OP); -- TG_OP = special variable (insert, update)
		
		return new; -- acts as commit
	
	exception -- postgre automatically rolls back in case of exception
		when others then
		insert into vehicle_discounts_audit(vehicle_id, old_discount, new_discount, operation, err)
		values(new.vehicle_id, old_discount_value, null, 'ERROR', SQLERRM);
		
		raise; -- acts as rollback
	end;
end;
$$ language plpgsql;

-- create trigger
create trigger trigger_update_vehicle_discounts
after insert or update on vehicles
for each row -- for each row is overkill? only inserted/updated rows?
execute function update_discount_on_old_vehicles_with_audit();

-- test the trigger
insert into vehicles(make, model, year, license_plate, vehicle_type, current_location, status_id) 
VALUES('Toyota', 'Corolla', 2002, '2u3 1513', 8, 1, 1);

-- 2.g - TRANSACTION
-- is inside the trigger function

-- 2.h - USER

create user bob with password 'bobspassword';
drop user bob;

grant select on table vehicles to bob;
grant all privileges on database postgres to bob;
grant all privileges on all tables in schema public to bob;

alter user bob with superuser; -- superuser rights

-- when new table is create bob will have these privileges by default
alter default privileges in schema public grant select, insert, update, delete on tables to bob;
alter default privileges in schema public revoke select, insert, update, delete on tables from bob;

-- roles are like user groups, usually dont have login capability(can be done tho)
create role marketing;
drop role marketing;

grant marketing to bob;
revoke marketing from bob;

-- usage allows the role to see the schema, no access
grant usage on schema public to marketing; 
-- grants select right, but wont work(permission denied) withou above line - usage right
grant select on all tables in schema public to marketing; 


-- 2.i LOCK
| Lock Mode           | What it does                                                                                                     | Conflicts With                             |
| ------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| ACCESS SHARE        | Read-only access (`SELECT`). Doesn’t block other reads, conflicts with `LOCK TABLE IN EXCLUSIVE MODE` or higher. | Access exclusive                           |
| ROW SHARE           | Acquired automatically by `SELECT FOR UPDATE`. Allows concurrent reads, blocks `ACCESS EXCLUSIVE`.               | Access exclusive                           |
| ROW EXCLUSIVE       | Acquired automatically by `INSERT`, `UPDATE`, `DELETE`. Blocks `ACCESS EXCLUSIVE`.                               | Access exclusive                           |
| SHARE               | Allows multiple sessions to lock for read purposes, blocks data-modifying locks.                                 | ROW EXCLUSIVE, EXCLUSIVE, ACCESS EXCLUSIVE |
| SHARE ROW EXCLUSIVE | Stronger; allows only reads; conflicts with writes.                                                              | Most other locks                           |
| EXCLUSIVE           | Blocks writes and some other locks.                                                                              | Most other locks                           |
| ACCESS EXCLUSIVE    | Strongest: blocks everything else on table.                                                                      | All                                        |

create user user1 with password 'password';
grant all privileges on payments to user1;

create user user2 with password 'password';
grant all privileges on payments to user2;

-- user 1
begin;
select * from payments where payment_id =1 for update; -- row exclusive lock on row id=1

-- user 2
begin;
update payments
set payment_date = current_date
where payment_id = 1;
-- user 2 goes into waiting mode -> has to wait for user1 to commit or rollback

-- user 1
commit; -- row lock is released and user2 transaction proceeds


-- user1
-- table exclusive lock
begin;
lock table payments in access exclusive mode;
-- user1 has exclusive lock; nobody else can read/write table

-- user2
begin;
select * from payments;
-- user2 will wait until user1 commits
