-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- destroy old tables so we can recreate them from scratch
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS service_request;


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
<<<<<<< HEAD
	property_name varchar(100) not null,
	offer_available boolean not null,
	number_of_bedrooms int not null,
	number_of_bathrooms int not null,
	rent int not null,
	property_description varchar(1000) not null,
=======
	number_of_bedrooms int not null,
	number_of_bathrooms int not null,
	cost int not null,
	proprty_description varchar(1000) not null,
>>>>>>> 1615c070e627da8e3590b83acbb924a7973fc46c
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
	
         constraint fk_property_id foreign key (property_id) references property(property_id)
	
	);
	
CREATE TABLE service_request
(
	property_id int not null,
	description varchar(300) not null,
	request_status varchar(100) not null,
	
          constraint fk_property_id foreign key (property_id) references property(property_id)
	
	);




	
--populate data
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email) VALUES ('John', 'Smith', 'smith1', 'password', 'admin', '6142225656', 'john1@gmail.com');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email) VALUES ('Ryan', 'King', 'kingr', 'password', 'admin', '6142225622', 'ryan1@gmail.com');
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email) VALUES ('Josh', 'Niko', 'nikor', 'password', 'admin', '6142335622', 'niko1@gmail.com');

INSERT INTO address(street_name1, street_name2, city, state,  zipcode) VALUES ('1212 Kinnear Road', 'rev1 Building', 'Columbus', 'Ohio', '43015');


INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('2000', 'Polaris Point', 'yes', '3', '2', '1200', 'Come home to Orange Woods, a charming apartment home community in Lewis Center, Ohio. Situated on a wood-lined street, we offer the feel of rural living while still having the conveniences of a big city.', 'Apartment', 'available', '1', '1', '1212 Polaris Road', 'Polaris Apartment', 'Columbus', 'Ohio', '43081');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('1500', 'Swamill Square', 'no', '2', '2', '1000', 'Situated on a wood-lined street, we offer the feel of rural living while still having the conveniences of a big city.', 'Apartment', 'available', '2', '1', '1212 Swamill Road', 'Swamill', 'Columbus', 'Ohio', '43025');

INSERT INTO property ( square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('950',  'Hiliard Square', 'yes', '1', '1', '900', 'Beautiful Apartments for Singles', 'Apartment', 'available', '3', '1', '101 Robert Road', 'Swamill', 'Hiliard', 'Ohio', '43018');


INSERT INTO payment(rent, property_id) VALUES ('1200', '1');
INSERT INTO payment(rent, property_id) VALUES ('1000', '1');
	
INSERT INTO service_request(property_id, description, request_status) VALUES ('1', 'Great room electric sockets are not working', 'pending');
INSERT INTO service_request(property_id, description, request_status) VALUES ('1', 'Garbage disposal is not working', 'done');


=======

	
--populate data
INSERT INTO users ( first_name, last_name, user_name, password, role, phone_number, email) VALUES ('John', 'Smith', 'smith1', 'password', 'admin', '6142225656', 'john1@gmail.com');


INSERT INTO address(street_name1, street_name2, city, state,  zipcode) VALUES ('1212 Kinnear Road', 'rev1 Building', 'Columbus', 'Ohio', '43015');


INSERT INTO property ( square_feet, number_of_bedrooms, number_of_bathrooms, cost, proprty_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state,  zipcode) 
VALUES ('2000', '3', '2', '1200', 'Come home to Orange Woods, a charming apartment home community in Lewis Center, Ohio. Situated on a wood-lined street, we offer the feel of rural living while still having the conveniences of a big city.', 'Apartment', 'available', '1', '1', '1212 Polaris Road', 'Polaris Apartment', 'Columbus', 'Ohio', '43081');

INSERT INTO payment(rent, property_id) VALUES ('1200', '1');
	
INSERT INTO service_request(property_id, description, request_status) VALUES ('1', 'Great room electric sockets are not working', 'pending');


----- SQL queries

//Select * from user;
//select * from address;
select * from property;
//select * from payment;
//select * from service_request;



COMMIT;