-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- destroy old tables so we can recreate them from scratch
DROP TABLE IF EXISTS application;
DROP TABLE IF EXISTS service_request;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS users;



CREATE TABLE users
(
        user_id serial,
        first_name varchar(100) not null,
        last_name varchar(100) not null,
        user_name varchar(100) not null,
        password varchar(100) not null,
        role varchar(100) not null,
        phone_number varchar(100) not null,
        email varchar(100) not null,
        salt varchar(225) not null,

        constraint pk_user_id primary key (user_id)
);

CREATE TABLE address
(
	address_id serial,
	street_name1 varchar(200) not null,
	street_name2 varchar(200),
        city varchar(100) not null,
        state varchar(100) not null,
        zipcode int not null,
        
	constraint pk_address_id primary key (address_id)
);
	

CREATE TABLE property
(
	property_id serial,
	square_feet int not null,
	property_name varchar(100) not null,
	offer_available boolean not null,
	number_of_bedrooms int not null,
	number_of_bathrooms int not null,
	rent int not null,
	property_description varchar(1000) not null,
	property_type varchar(100) not null,
	property_status varchar(100) not null, 
	user_id int not null,
	address_id int not null,
	street_name1 varchar(200) not null,
	street_name2 varchar(200),
        city varchar(100) not null,
        state varchar(100) not null,
        zipcode int not null,

	constraint pk_property_id primary key (property_id),
	constraint fk_user_id foreign key (user_id) references users(user_id),
	constraint fk_address_id foreign key (address_id) references address(address_id)
);

CREATE TABLE payment
(
	rent int not null,
	property_id int not null,
	user_id int not null,
	
        constraint fk_property_id foreign key (property_id) references property(property_id),
        constraint fk_user_id foreign key (user_id) references users(user_id)
);
	
CREATE TABLE service_request
(
        property_id int not null,
        description varchar(300) not null,
        request_status varchar(100) not null,
        user_id int not null,
        
        constraint fk_property_id foreign key (property_id) references property(property_id),
        constraint fk_user_id foreign key (user_id) references users(user_id)
);

CREATE TABLE application
(
        application_id serial,
        property_id int not null,
        first_name varchar(100) not null,
        last_name varchar(100) not null,
        ssn int not null,
        birthdate varchar(100) not null,
        current_employer varchar(100),
        annual_income int,
        phone_number varchar(100) not null,
        email varchar(100) not null,
        address_line1 varchar(100) not null,
        address_line2 varchar(100),
        city varchar(100) not null,
        state varchar(100) not null,
        zipcode int not null,

        constraint pk_application_id primary key (application_id),
        constraint fk_property_id foreign key (property_id) references property(property_id)
);





	
--populate data

INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Manisha', 'Ingale', 'Manisha', 'O6DBAoCmMb2MfqO99yr8ew==', 'tenant', '6142225656', 'manisha@gmail.com', 'MR9aELVtkW1Pwe2PSpSdh1B4nLUNtJHY6nciNruecqSK9Rp179Lq7+Nq8NM0R6DG9QN51sHHvGg+cMmwoay2bqQrqpP6s6YyfokdVJPOD2PvUZZcofCFT7x2tW6jzhNpTSSaEsgSJBMjGjj7eRMDuqLoMt7PwoejzceqpzzGViU=');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Andrew', 'Frank', 'Andrew', 'O6DBAoCmMb2MfqO99yr8ew==', 'admin', '6143335678', 'andrew@gmail.com', 'MR9aELVtkW1Pwe2PSpSdh1B4nLUNtJHY6nciNruecqSK9Rp179Lq7+Nq8NM0R6DG9QN51sHHvGg+cMmwoay2bqQrqpP6s6YyfokdVJPOD2PvUZZcofCFT7x2tW6jzhNpTSSaEsgSJBMjGjj7eRMDuqLoMt7PwoejzceqpzzGViU=');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Nikhita', 'Reddy', 'Nikhita', 'E20LniuEBjAkjZzflkYThw==', 'admin', '6144325612', 'nikki@gmail.com', '/p7I5smTqgeH8fyspVTrux4gYPUZOV3Z+LXHHOvBt1nUCw/SHolyNMRxFZEi8GT2Idu1j5XuOw7bhs4G7N5ZT8SWbdg56RV05nTMD2SybG1cOVmCwnP9QlGSglDHaozQH6RXcC5I518vp0bp/DlLqJ4K90117/1fa1ZvMUBMGaY=');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Maulik', 'Patel', 'Maulik', 'x+eIB47ViMkcMx4Oc0Wf1g==', 'tenant', '6148752323', 'maulik@gmail.com', 'X8s+kCriKKyR7r640msEn0vWL706XTewF1DJBF2c6GLWdwrHDVmntL66qQGsJegVbi706xs6ijmJU9v13o1qgHQ50dCbDFjTyWVILFloR7qrnKkyF39oUJ5+zf58lw9vPkjSU+6x7kNT4UsIMmf+36RJVPyVjTYYx4UCdvnzfso=');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Mike', 'Ryan', 'Mike', 'lsDxwaMhbuXl2F9KnuCwFw==', 'tenant', '6142795423', 'mike@gmail.com', 'ZblQfOgpTuFErD4KQvwjCmU3hQ4Cmi82vlVS3zLj3Bh+qcbAIVH+b0TWScoYfsfI8eQwsfMMgb5AT027cSka4W+qGLmVRlngisw1wSSHJ3G0kdjFXqE/THtTFpMiOkGWUcLIxBgPFTln43eV0SmIhOQ+04Smm/WpdCrdZ+2USZE=');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES ('Steve', 'Carmichael', 'Steve', 'lsDxwaMhbuXl2F9KnuCwFw==', 'propertyOwner', '6142795467', 'steve@gmail.com', 'ZblQfOgpTuFErD4KQvwjCmU3hQ4Cmi82vlVS3zLj3Bh+qcbAIVH+b0TWScoYfsfI8eQwsfMMgb5AT027cSka4W+qGLmVRlngisw1wSSHJ3G0kdjFXqE/THtTFpMiOkGWUcLIxBgPFTln43eV0SmIhOQ+04Smm/WpdCrdZ+2USZE=');


INSERT INTO address(street_name1, street_name2, city, state,  zipcode) VALUES ('1212 Kinnear Road', 'rev1 Building', 'Columbus', 'Ohio', '43015');


INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('2000', 'Hudson Square Apartments', 'yes', '3', '2', '1200', 'Our upscale apartment community offers luxury one and two bedroom apartment homes specially designed for your comfort and convenience.', 'Apartment', 'Available', '1', '1', '5459 Olivia Michal Pl', ' ', 'Westerville', 'Ohio', '43081');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1500', 'Dublin Square Apartments', 'no', '2', '2', '1000', 'Our Square is lively and fun. Experience a community where excitement and adventure is a way of life.', 'Apartment', 'Available', '2', '1', '7331 Skyline Dr', ' ', 'Columbus', 'Ohio', '43235');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('950',  'Hiliard Square', 'yes', '1', '1', '900', 'Welcome to Hilliard Square, a great place to call home.', 'Apartment', 'Available', '3', '1', '4674 Leap Ct', ' ', 'Hiliard', 'Ohio', '43026');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('950',  '801 Polaris', 'yes', '1', '1', '970', '801 Polaris is an apartment community that brings the convenience of suburban living to the sophistication of the urban experience.', 'Apartment', 'Available', '5', '1', '801 Polaris Parkway', ' ', 'Columbus', 'Ohio', '43240');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1360',  'The Garratt', 'yes', '3', '2', '1250', 'Located in the top-rated Westerville School District and near popular recreation spots, our Cortland community delivers the best of Westerville living to your doorstep.', 'Apartment', 'Available', '5', '1', '5415 Turtle Station', ' ', 'Westerville', 'Ohio', '43081');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1000',  'Albany Woods', 'no', '2', '2', '1050', 'Tranquility awaits beyond our gates in one of New Albany''s highest rated apartment communities!', 'Apartment', 'Available', '6', '1', '5775 Harlem Road', ' ', 'New Albany', 'Ohio', '43054');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1100',  'Albany Landings', 'no', '1', '2', '1350', 'With a picturesque location just minutes from SR-161 and world-class shopping at Easton Town Center, welcome to the ideal apartment community in New Albany.', 'Apartment', 'Available', '6', '1', '5500 Bilberry Ln', ' ', 'Westerville', 'Ohio', '43081');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1090',  'Albany Glenn', 'no', '1', '2', '1250', 'New Albany''s Premier Apartment Home Neighborhood. Where quality meets sophistication', 'Apartment', 'Available', '6', '1', '3691 Albany Chase', ' ', 'Columbus', 'Ohio', '43230');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1140',  'The Gramercy', 'no', '1', '2', '950', 'Meet a different kind of apartment homes that combine urban barn style with modern, sophisticated finishes.', 'Apartment', 'Available', '5', '1', '5935 Central College Road', ' ', 'New Albany', 'Ohio', '43054');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1070',  'Prescott Place Apartments', 'no', '1', '2', '850', 'Leave your troubles at the door, as the management team at Prescott Place has anticipated your every need for a carefree lifestyle.', 'Apartment', 'Rented', '5', '1', '351 Peat Moss Drive', ' ', 'Columbus', 'Ohio', '43235');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1010',  'The Heights at Worthington', 'no', '1', '2', '1250', 'Our one of the kind location provides residents the best of Living, Dining and Shopping all within their backyard.', 'Apartment', 'Available', '5', '1', '160 W Wilson Bridge Road', ' ', 'Worthington', 'Ohio', '43085');



INSERT INTO service_request(property_id, description, request_status, user_id) VALUES ('1', 'Great room electric sockets are not working', 'Pending', '1');
INSERT INTO service_request(property_id, description, request_status, user_id) VALUES ('2', 'Sink garbage disposal is not working', 'Pending', '4');
INSERT INTO service_request(property_id, description, request_status, user_id) VALUES ('3', 'Master bedroom bathroom shower is leaking', 'Pending', '5');
INSERT INTO service_request(property_id, description, request_status, user_id) VALUES ('4', 'Fire alarm battery is down', 'Completed', '5');

INSERT INTO payment(rent, property_id, user_id) VALUES ('1200', '1', '1');
INSERT INTO payment(rent, property_id, user_id) VALUES ('1000', '2', '2');
INSERT INTO payment(rent, property_id, user_id) VALUES ('900', '3', '3');

INSERT INTO application(property_id, first_name, last_name, ssn, birthdate, current_employer, annual_income, phone_number, email, address_line1, address_line2, city, state, zipcode)
VALUES ('1', 'Manisha', 'Ingale', '123456789', '1990-10-10', 'Nationwide', '90000', '6142225656', 'manisha@gmail.com', 'High Street', '1212', 'Columbus', 'OH', '43035');
INSERT INTO application(property_id, first_name, last_name, ssn, birthdate, current_employer, annual_income, phone_number, email, address_line1, address_line2, city, state, zipcode)
VALUES ('2', 'Andrew', 'Frank', '123456789', '1985-12-12', 'Tech Elevator', '120000', '6143335678', 'andrew@gmail.com', 'Main Street', '3423', 'Columbus', 'OH', '43037');
INSERT INTO application(property_id, first_name, last_name, ssn, birthdate, current_employer, annual_income, phone_number, email, address_line1, address_line2, city, state, zipcode)
VALUES ('3', 'Nikhita', 'Reddy', '123456789', '1992-07-07', 'Chase', '90000', '6144325612', 'nikhita@gmail.com', 'North Street', '5459', 'Columbus', 'OH', '43081');



COMMIT;