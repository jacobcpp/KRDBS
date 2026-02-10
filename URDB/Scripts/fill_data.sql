insert into locations (name, address, city) 
values('Centrala Praha','Hlavni 1', 'Praha'),
		('Europcar Prague Downtown', 'Elišky Krásnohorské 134/9', 'Prague'),
		('SIXT Prague Main Train Station', 'Wilsonova 300/8', 'Prague'),
		('Right Cars Prague Airport', 'Aviatická 1092/8', 'Prague'),
		('SIXT Prague Airport', 'Aviatická 1', 'Prague'),
		('Avis Prague City Center', 'Klimentská 46', 'Prague'),
		('Hertz Hotel Diplomat', 'Evropská 15', 'Prague'),
		('Europcar Brno', 'Křenová 52', 'Brno'),
		('SIXT Brno', 'Hlinky 110', 'Brno'),
		('Right Cars Brno', 'Heršpická 11', 'Brno'),
		('Avis Brno', 'Heršpická 11', 'Brno'),
		('Europcar Ostrava', 'Nádražní 1', 'Ostrava'),
		('SIXT Ostrava', 'Nádražní 1', 'Ostrava'),
		('Right Cars Ostrava', 'Nádražní 1', 'Ostrava'),
		('Avis Ostrava', 'Nádražní 1', 'Ostrava'),
		('Europcar Plzeň', 'Nádražní 5', 'Plzeň'),
		('SIXT Plzeň', 'Nádražní 5', 'Plzeň'),
		('Right Cars Plzeň', 'Nádražní 5', 'Plzeň'),
		('Avis Plzeň', 'Nádražní 5', 'Plzeň'),
		('Europcar Liberec', 'Nádražní 1', 'Liberec'),
		('SIXT Liberec', 'Nádražní 1', 'Liberec');

insert into vehicletypes (type_name )
values ('Economy'),
		('Compact'),
		('Intermediate'),
		('Full-size'),
		('Standard SUV'),
		('Premium Sedan'),
		('Luxury'),
		('Convertible'),
		('Minivan'),
		('Cargo Van');

insert into vehiclestatuses (description)
values('available'),
		('maintenance'),
		('borrowed');



/* PYTHON
import random
import faker

fake = faker.Faker('en_US')

# Vehicle types (IDs from 1 to 10)
vehicle_types = list(range(1, 11))

# Locations (IDs from 1 to 20)
locations = list(range(1, 21))

# Status options
statuses = ['available', 'borrowed', 'maintenance']

# Example makes and models
makes_models = {
    'Toyota': ['Yaris', 'Corolla', 'Camry', 'RAV4'],
    'Volkswagen': ['Polo', 'Golf', 'Passat', 'Tiguan'],
    'Skoda': ['Fabia', 'Octavia', 'Superb', 'Kodiaq'],
    'Ford': ['Fiesta', 'Focus', 'Mondeo', 'Kuga'],
    'Hyundai': ['i10', 'i20', 'Elantra', 'Tucson'],
    'BMW': ['3 Series', '5 Series', 'X1', 'X5'],
    'Mercedes-Benz': ['A-Class', 'C-Class', 'E-Class', 'GLC'],
    'Audi': ['A1', 'A3', 'A4', 'Q5'],
    'Renault': ['Clio', 'Megane', 'Kadjar', 'Captur'],
    'Peugeot': ['208', '308', '508', '3008']
}

# Generate 100 vehicle entries
vehicles = []
for _ in range(100):
    make = random.choice(list(makes_models.keys()))
    model = random.choice(makes_models[make])
    year = random.randint(2015, 2023)
    license_plate = fake.license_plate()
    vehicle_type = random.choice(vehicle_types)
    current_location = random.choice(locations)
    status = random.choice(statuses)
    
    vehicles.append((make, model, year, license_plate, vehicle_type, current_location, status))

# Create SQL insert statements
sql_statements = "INSERT INTO vehicles (make, model, year, license_plate, vehicle_type, current_location, status) VALUES\n"
sql_statements += ",\n".join([
    f"('{v[0]}', '{v[1]}', {v[2]}, '{v[3]}', {v[4]}, {v[5]}, '{v[6]}')" for v in vehicles
]) + ";"

print(sql_statements)
 */

insert into vehicles (make, model, year, license_plate, vehicle_type, current_location, status_id) VALUES
('Ford', 'Kuga', 2018, 'GKR-1389', 8, 4, 1),
('Hyundai', 'Tucson', 2020, '657 6SF', 6, 7, 1),
('BMW', '5 Series', 2018, 'HSZ 323', 1, 10, 1),
('Audi', 'A4', 2017, 'WJQ 397', 9, 17, 1),
('Skoda', 'Kodiaq', 2019, 'DYA-1548', 7, 15, 1),
('BMW', '3 Series', 2016, 'OXE-3817', 7, 2, 1),
('Skoda', 'Fabia', 2019, '607FOX', 2, 14, 1),
('Skoda', 'Kodiaq', 2019, '66AS759', 8, 5, 1),
('Audi', 'A4', 2021, 'ZSK 289', 8, 4, 1),
('Hyundai', 'Tucson', 2023, 'KIQ 324', 8, 13, 1),
('Toyota', 'Camry', 2021, '3QLT168', 3, 3, 1),
('Hyundai', 'i20', 2022, '03N H26', 4, 1, 1),
('Toyota', 'Corolla', 2022, '8LSQ958', 2, 2, 1),
('Mercedes-Benz', 'E-Class', 2022, 'H22-GTA', 4, 3, 1),
('Ford', 'Mondeo', 2017, 'F24-VHT', 2, 5, 1),
('Mercedes-Benz', 'C-Class', 2021, '7-6796D', 8, 12, 1),
('Peugeot', '508', 2017, '9DBC323', 5, 2, 1),
('Hyundai', 'i10', 2015, 'THR K69', 5, 10, 1),
('Ford', 'Fiesta', 2020, '15-VT69', 10, 18, 1),
('Renault', 'Captur', 2023, 'TXY-4733', 10, 9, 1),
('Skoda', 'Fabia', 2016, 'EYU-9839', 2, 8, 1),
('Skoda', 'Kodiaq', 2019, '00-9281S', 10, 12, 1),
('Ford', 'Fiesta', 2021, 'CUE-651', 9, 14, 1),
('Mercedes-Benz', 'E-Class', 2015, 'IVM-991', 2, 7, 1),
('Skoda', 'Octavia', 2022, 'KCZ-380', 4, 8, 1),
('Ford', 'Kuga', 2021, '91I 8043', 6, 15, 1),
('Skoda', 'Kodiaq', 2015, '7-14124', 4, 15, 1),
('Toyota', 'RAV4', 2017, 'GVX-939', 9, 8, 1),
('Peugeot', '308', 2020, '3-Z8836', 9, 12, 1),
('Audi', 'A1', 2016, '2SE3942', 3, 6, 1),
('Audi', 'A3', 2015, '0N376', 10, 3, 1),
('Ford', 'Mondeo', 2020, 'OBA 349', 6, 7, 1),
('Skoda', 'Superb', 2018, 'OLQ 085', 1, 14, 1),
('Mercedes-Benz', 'C-Class', 2017, '69R ZV5', 3, 2, 1),
('Peugeot', '3008', 2020, 'UY3 S1R', 10, 17, 1),
('Skoda', 'Superb', 2021, '1N749', 4, 17, 1),
('Peugeot', '308', 2022, '12-15923', 8, 17, 1),
('Volkswagen', 'Polo', 2018, '767 KVI', 10, 5, 1),
('Ford', 'Mondeo', 2023, 'KLF 889', 9, 15, 1),
('Audi', 'A1', 2019, '8-L8714', 3, 16, 1),
('Hyundai', 'i10', 2020, 'HWK 977', 5, 6, 1),
('Skoda', 'Octavia', 2023, '456 BQD', 3, 1, 1),
('Mercedes-Benz', 'C-Class', 2023, '6L-IBFG', 10, 17, 1),
('Renault', 'Captur', 2016, '5O-NQRG', 7, 16, 1),
('Ford', 'Fiesta', 2017, '585-JZLY', 9, 2, 1),
('Toyota', 'RAV4', 2015, '0YN 640', 2, 5, 1),
('Peugeot', '3008', 2016, '810-ZBI', 1, 8, 1),
('Hyundai', 'Tucson', 2022, 'ZZD 350', 8, 3, 1),
('Audi', 'Q5', 2023, '130 EYL', 4, 17, 1),
('Toyota', 'Corolla', 2022, '4EN1594', 8, 1, 1),
('Ford', 'Fiesta', 2021, 'IKS 198', 10, 13, 1),
('Ford', 'Fiesta', 2017, '427 3BO', 6, 8, 1),
('Toyota', 'Yaris', 2018, 'IKG 687', 5, 16, 1),
('Hyundai', 'i10', 2017, '083-XPG', 3, 16, 1),
('Audi', 'A4', 2019, 'UTP 7428', 9, 11, 1),
('Toyota', 'Yaris', 2021, '8-L2180', 1, 9, 1),
('Hyundai', 'i20', 2015, '446 TMA', 6, 18, 1),
('Mercedes-Benz', 'C-Class', 2020, 'LZ-3427', 6, 17, 1),
('BMW', 'X5', 2015, 'RQW-738', 9, 12, 1),
('Peugeot', '508', 2019, 'HVH 640', 7, 8, 1),
('Audi', 'A4', 2017, 'N18-LDR', 4, 9, 1),
('Hyundai', 'i20', 2019, '4T 28497', 9, 14, 1),
('Ford', 'Fiesta', 2022, '6T-QWTL', 10, 8, 1),
('Renault', 'Captur', 2019, '0A 07040', 10, 10, 1),
('Hyundai', 'i20', 2018, '753PVQ', 7, 13, 1),
('Skoda', 'Kodiaq', 2015, 'HKL 061', 2, 5, 1),
('Peugeot', '308', 2015, 'UZK-510', 2, 6, 1),
('Toyota', 'Corolla', 2015, 'QMU 234', 4, 8, 1),
('Volkswagen', 'Passat', 2018, 'UOH 077', 1, 2, 1),
('Audi', 'A1', 2018, '1EN 038', 10, 5, 1),
('Renault', 'Kadjar', 2017, 'IOE 748', 4, 10, 1),
('BMW', 'X1', 2016, 'Q42-11G', 10, 15, 1),
('Peugeot', '208', 2015, 'MEC-9468', 3, 6, 1),
('Ford', 'Mondeo', 2018, 'NVQ-6435', 1, 11, 1),
('Ford', 'Kuga', 2020, '0MID 50', 5, 9, 1),
('Volkswagen', 'Tiguan', 2021, 'YUG 6416', 4, 8, 1),
('Audi', 'Q5', 2019, '6JRP 95', 8, 12, 1),
('Volkswagen', 'Polo', 2022, 'ALG 693', 9, 16, 1),
('Volkswagen', 'Tiguan', 2017, '6KA68', 6, 19, 1),
('Ford', 'Mondeo', 2023, 'DP2 E8E', 8, 18, 1),
('Audi', 'A1', 2023, 'EEG 522', 6, 9, 1),
('Hyundai', 'Elantra', 2023, '360 6749', 3, 4, 1),
('Peugeot', '208', 2023, 'ZR 35839', 2, 17, 1),
('Toyota', 'Yaris', 2018, '169 6VP', 5, 3, 1),
('Peugeot', '508', 2020, '7F 8B8PAJ', 8, 19, 1),
('Peugeot', '208', 2018, '0LY U99', 10, 7, 1),
('Ford', 'Mondeo', 2018, '333 JTC', 8, 7, 1),
('Skoda', 'Kodiaq', 2017, '6-24838N', 3, 14, 1),
('Mercedes-Benz', 'A-Class', 2018, '4FO 669', 3, 9, 1),
('Ford', 'Focus', 2022, '291WY', 9, 18, 1),
('Ford', 'Kuga', 2018, 'ZHU-133', 3, 20, 1),
('Volkswagen', 'Polo', 2016, '68D V89', 10, 10, 1),
('Peugeot', '308', 2016, '63Z E86', 9, 16, 1),
('Skoda', 'Octavia', 2016, 'K06 8XT', 2, 9, 1),
('BMW', '3 Series', 2015, '389 QYM', 6, 5, 1),
('Toyota', 'Corolla', 2020, '2DN9856', 1, 20, 1),
('BMW', 'X5', 2022, '050-204', 10, 8, 1),
('BMW', '5 Series', 2017, 'FLX 327', 10, 5, 1),
('Skoda', 'Fabia', 2023, '879 KSH', 9, 3, 3),
('Mercedes-Benz', 'A-Class', 2023, '484-616', 1, 10, 1);

insert into maintenancerecords (vehicle_id, description, date, cost) values
(5, 'Oil change and filter replacement', '2024-11-12', 1500),
(12, 'Tire rotation and balancing', '2025-01-08', 1200),
(23, 'Brake pad replacement', '2025-03-14', 2500),
(7, 'Engine diagnostics and tuning', '2025-04-02', 3200),
(19, 'Air conditioning repair', '2024-12-20', 2700),
(31, 'Transmission fluid change', '2025-02-18', 1800),
(44, 'Battery replacement', '2024-10-05', 2200),
(38, 'Suspension check and repair', '2025-05-11', 3000),
(10, 'Windshield wiper motor replacement', '2025-06-01', 900),
(2, 'Coolant system flush', '2025-03-27', 1400),
(17, 'Timing belt replacement', '2024-09-14', 4600),
(26, 'Fuel system cleaning', '2025-01-30', 2100),
(8, 'New tires installation', '2024-08-22', 5200),
(14, 'Exhaust system repair', '2024-11-03', 2800),
(35, 'Interior detailing and cleaning', '2025-04-15', 1000),
(41, 'Headlight replacement', '2025-02-07', 600),
(3, 'Power steering repair', '2025-05-22', 2500),
(22, 'Brake fluid flush', '2025-03-01', 1100),
(16, 'Air filter and cabin filter replacement', '2025-01-17', 800),
(29, 'Spark plug replacement', '2024-12-09', 1600);

insert into customers (first_name, last_name, email, phone_number) values
('John', 'Smith', 'john.smith@example.com', '+420 601 234 567'),
('Anna', 'Nováková', 'anna.novakova@example.com', '+420 724 111 222'),
('Petr', 'Dvořák', 'petr.dvorak@example.com', '+420 773 123 456'),
('Lucie', 'Svobodová', 'lucie.svobodova@example.com', '+420 608 987 654'),
('Tomáš', 'Horák', 'tomas.horak@example.com', '+420 739 456 789'),
('Klára', 'Kučerová', 'klara.kucerova@example.com', '+420 702 456 321'),
('Martin', 'Beneš', 'martin.benes@example.com', '+420 775 321 654'),
('Eva', 'Králová', 'eva.kralova@example.com', '+420 737 765 432'),
('Michal', 'Fiala', 'michal.fiala@example.com', '+420 604 987 321'),
('Jana', 'Sedláčková', 'jana.sedlackova@example.com', '+420 728 888 111'),
('Daniel', 'Kříž', 'daniel.kriz@example.com', '+420 776 222 333'),
('Barbora', 'Kolářová', 'barbora.kolarova@example.com', '+420 601 999 000'),
('Roman', 'Urban', 'roman.urban@example.com', '+420 734 567 123'),
('Tereza', 'Pospíšilová', 'tereza.pospisilova@example.com', '+420 739 888 777'),
('Filip', 'Procházka', 'filip.prochazka@example.com', '+420 733 555 444'),
('Kateřina', 'Veselá', 'katerina.vesela@example.com', '+420 703 666 555'),
('David', 'Němec', 'david.nemec@example.com', '+420 721 123 123'),
('Veronika', 'Marešová', 'veronika.maresova@example.com', '+420 778 321 321'),
('Ondřej', 'Černý', 'ondrej.cerny@example.com', '+420 722 222 444'),
('Monika', 'Malá', 'monika.mala@example.com', '+420 709 432 234'),
('Jakub', 'Hlavatý', 'jakub.hlavaty@example.com', '+420 601 321 999');

insert into rentals (customer_id, vehicle_id, start_date, end_date, cost, pickup_location, return_location) values
(1, 12, '2025-05-01', '2025-05-05', 3200, 5, 6),
(4, 8, '2025-04-20', '2025-04-25', 2700, 3, 3),
(2, 27, '2025-03-10', '2025-03-12', 1200, 1, 2),
(5, 19, '2025-02-15', '2025-02-20', 3100, 4, 4),
(8, 33, '2025-01-05', '2025-01-10', 2500, 2, 5),
(10, 7, '2025-06-01', '2025-06-03', 1600, 6, 6),
(3, 41, '2025-05-18', '2025-05-21', 1800, 7, 8),
(7, 55, '2025-04-11', '2025-04-16', 2900, 9, 9),
(9, 61, '2025-03-01', '2025-03-06', 2400, 10, 11),
(11, 75, '2025-02-25', '2025-03-01', 3300, 12, 12),
(6, 49, '2025-01-15', '2025-01-18', 1900, 8, 7),
(12, 90, '2025-05-07', '2025-05-10', 2100, 13, 14),
(14, 22, '2025-06-03', '2025-06-06', 2200, 15, 16),
(16, 18, '2025-04-04', '2025-04-08', 2800, 3, 2),
(18, 11, '2025-02-12', '2025-02-16', 2600, 17, 17),
(13, 66, '2025-03-23', '2025-03-27', 2700, 19, 19),
(17, 38, '2025-01-10', '2025-01-13', 1500, 20, 1),
(19, 99, '2025-06-05', '2025-06-30', 3000, 11, 11),
(15, 5, '2025-05-20', '2025-05-23', 1700, 16, 16),
(20, 3, '2025-04-01', '2025-04-04', 2000, 14, 13);

insert into payments(rental_id, payment_date) values
(1, '2025-05-01'),
(2, '2025-04-20'),
(3, '2025-03-10'),
(4, '2025-02-15'),
(5, '2025-01-05'),
(6, '2025-06-01'),
(7, '2025-05-18'),
(8, '2025-04-11'),
(9, '2025-03-01'),
(10, '2025-02-25'),
(11, '2025-01-15'),
(12, '2025-05-07'),
(13, '2025-06-03'),
(14, '2025-04-04'),
(15, '2025-02-12');