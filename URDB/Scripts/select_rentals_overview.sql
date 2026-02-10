
create view rentals_overview as
select c.first_name || ' ' || c.last_name as customer,
	v.make || ' ' || v.model || ' ' || v.year as vehicle,
	r.start_date as from,
	r.end_date as to,
	r.end_date-r.start_date as total_days,
	p.payment_date,
	ls.name as pickup,
	lr.name as return
from rentals r
join customers c on c.customer_id = r.customer_id
join vehicles v on v.vehicle_id = r.vehicle_id
join locations ls on ls.location_id = r.pickup_location
join locations lr on lr.location_id = r.return_location
left join payments p on p.rental_id = r.rental_id;


select c.first_name || ' ' || c.last_name as customer,
	v.make || ' ' || v.model || ' ' || v.year as vehicle,
	r.start_date as from,
	r.end_date as to,
	r.end_date-r.start_date as total_days,
	p.payment_date,
	ls.name as pickup,
	lr.name as return
from rentals r
join customers c on c.customer_id = r.customer_id
join vehicles v on v.vehicle_id = r.vehicle_id
join locations ls on ls.location_id = r.pickup_location
join locations lr on lr.location_id = r.return_location
left join payments p on p.rental_id = r.rental_id