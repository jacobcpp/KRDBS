create table VehicleTypes(
	vehicle_type_id serial not null,
	type_name varchar(50),
	
	primary key (vehicle_type_id)
);

create table Locations(
	location_id serial not null,
	name varchar(70),
	address varchar(70),
	city varchar(50),
	
	primary key (location_id)
);

create table VehicleStatuses(
	status_id serial,
	description varchar(50),
	
	primary key(status_id)
);

create table Vehicles(
	vehicle_id serial not null,
	make varchar(50) not null,
	model varchar(50) not null,
	year int not null,
	license_plate varchar(10),
	vehicle_type int,
	current_location int,
	status_id int,
	
	primary key (vehicle_id),
	foreign key (vehicle_type) references VehicleTypes(vehicle_type_id),
	foreign key (current_location) references Locations(location_id),
	foreign key (status_id) references VehicleStatuses(status_id)
);

create table MaintenanceRecords(
	maintenance_id serial not null,
	vehicle_id int,
	description varchar(256),
	date date,
	cost int,
	
	primary key(maintenance_id),
	foreign key(vehicle_id) references Vehicles(vehicle_id)
);

create table Customers(
	customer_id serial not null,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(30),
	
	primary key (customer_id)
);

create table Rentals(
	rental_id serial not null,
	customer_id int,
	vehicle_id int,
	start_date date,
	end_date date,
	cost int,
	pickup_location int,
	return_location int,
	
	primary key (rental_id),
	foreign key (customer_id) references Customers(customer_id),
	foreign key (vehicle_id) references Vehicles(vehicle_id),
	foreign key (pickup_location) references Locations(location_id),
	foreign key (return_location) references Locations(location_id)
);

create table Payments(
	payment_id serial not null,
	rental_id int,
	payment_date date,
	
	primary key(payment_id),
	foreign key(rental_id) references Rentals(rental_id)
);