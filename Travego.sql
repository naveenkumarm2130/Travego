-- 	1.a. Create a schema named Travego. 
create database Travego;

-- Use the travego database
use Travego;

-- 1.b. Create the Passenger tables with the mentioned column names. 
create table Passenger
(
Passenger_ID int primary key,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);

-- 1.b	Create the Price tables with the mentioned column names. 
drop table price;
create table Price 
(
ID int primary key,
Bus_type varchar(20),
Distance int,
Fare int
);

-- 	1.c. Insert the data in the Passenger table
insert into Passenger
values 
(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol',	'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru',	600, 'Sleeper'),
(4,	'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M',	'Pune',	'Nagpur', 700, 'Sitting');

-- 1.c.	Insert the data in the Price table
insert into Price
values 
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700,	1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 240),
(12, 'Sitting', 1200, 1488),
(13, 'Sitting', 1500, 1860);

-- 2. Perform read operation on the designed table created in the above task using SQL script. 
select * from passenger;
-- 2.a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender, count(*) as Total_Pasengers from passenger where distance >=600 group by gender;

-- 2.b.	Find the minimum ticket price of a Sleeper Bus. 
select min(fare) as Minimum_Price from price where bus_type = 'sleeper';

-- 2.c.	Select passenger names whose names start with character 'S' 
select passenger_name from passenger where passenger_name like 'S%';

-- 2.d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select p.passenger_name, p.boarding_city, p.destination_city, p.bus_type, pr.fare as Price 
from passenger as p 
join price as pr on p.bus_type = pr.bus_type and p.distance = pr.distance;

-- 2.e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select * from passenger;
select p.passenger_name, p.distance, pr.fare as Ticket_Fare
from passenger as p
join price as pr on p.bus_type = pr.bus_type and p.distance = pr.distance
where p.distance = 1000 and p.bus_type = 'Sitting';
-- Answer is ZERO because there is no passenger who travelled 1000km in sitting type of bus

-- 2.f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select b.bus_type, fare from passenger as a, price as b
where passenger_name = 'Pallavi' and a.distance = b.distance;

-- 2.g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
select distinct distance from passenger order by distance desc; 

-- 2.h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables 
select passenger_name, (distance/(select sum(distance) from passenger)) as Percentage_of_Distance_Traveled from passenger;