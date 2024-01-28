use master;
alter database SpaceBank SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS SpaceBank;
CREATE DATABASE SpaceBank;
USE SpaceBank;
CREATE TABLE SpaceStation(
	stnId char(2),
    stnName varchar(50),
    pop bigint,
    food bigint,
    oxygen bigint,
    energy bigint,
    water bigint,
    PRIMARY KEY(stnId)
);

CREATE TABLE Users(
firstname varchar(50),
lastname varchar(50),
stnId char(2),
pwd varchar(30),
sbucks int,
PRIMARY KEY(firstname),
FOREIGN KEY (stnId) REFERENCES SpaceStation(stnId) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO SpaceStation(stnId, stnName, pop, food, oxygen, energy, water)
VALUES
('S1','AsiaCosmo Nexus', 4875348012, 84000000, 14000000, 12000000, 120000000),
('S2','Africor Stellar Outpost', 1216740123, 64000000, 8000000, 65000000, 800000000),
('S3','NorthAm Nexus Station', 579812043, 25000000, 4000000, 4300000, 345000000),
('S4','EuroCelestial Haven', 746202458, 34000000, 7400000, 6700000, 653000000),
('S5','AustroOrbit Oasis', 25698121, 9000000, 3500000, 2300000, 21400000),
('S6','Club Penguin Station', 40000, 140000, 1204122, 8000, 310000),
('S7','SouthAmeriSky Sanctuary',422501201,741000,120000,140000,5190000);


INSERT INTO Users(firstname,lastname,stnId,pwd,sbucks) values
('Mithish','Ravisankar','S3','Mithish123@',800000),
('Pratham','Shah','S5','Pratham123@',920000),
('Mahi','Gangal','S1','Mahi123@',919999),
('Sparsh','Khanna','S2','Sparsh123@',400);

select * from SpaceStation;
select * from Users;


CREATE TABLE services(
servId char(2) primary key,
servName varchar(40),
cost decimal(5,2),
servImageURL varchar(150)
);




CREATE TABLE Market(
prodId char(4) PRIMARY KEY,
prodName varchar(40),
prodPrice decimal(5,2),
prodDesc varchar(100),
cap int,
prodImageURL varchar(150)
);

CREATE TABLE Restaurant(
prodId char(3) PRIMARY KEY,
prodName varchar(40),
prodPrice decimal(5,2),
prodDesc varchar(100),
cap int,
prodImageURL varchar(150)
);
insert into services(servId, servName,cost,servImageURL) values
('S1','Fitness Center',7.50,'img/gym.jpeg'),
('S2','Laundromat',8.00,'img/laundry.jpeg'),
('S3','Swimming Pool',5.50,'img/pool.jpeg'),
('S4','Market',0.00,'img/market.jpeg'),
('S5','Restaurant',0.00,'img/restaurant.jpeg');



ALTER TABLE services ADD quota int;
UPDATE services SET quota=5 WHERE servId='S1';
UPDATE services SET quota=1 WHERE servId='S2';
UPDATE services SET quota=2 WHERE servId='S3';
UPDATE services SET quota=0 WHERE servId='S4';
UPDATE services SET quota=0 WHERE servId='S5';


select * from services;



insert into Market(prodId, prodName,prodPrice,prodDesc, cap, prodImageURL) values
('P1','Bread',4.50,'Flour based white bread, contains gluten and dairy',30,'img/bread.jpeg'),
('P2','Chicken Breasts',14.75,'Boneless and Skinless Chicken Breasts, 4 breasts',25,'img/chicken.jpeg'),
('P3','Brown Eggs',7.50,'A dozen chicken eggs',40,'img/eggs.jpeg'),
('P4','Vegetables',9.25,'Fresh produce made from our space garden',60,'img/freshproduce.jpeg'),
('P5','Milk',5.75,'2% milk, 750ml',45,'img/milk.jpeg'),
('P6','Hygiene Products',14.30,'Includes soap, feminine hygiene products and dental care',60,'img/hygiene products.jpeg'),
('P7','Spices',18.00,'A bunch of exotic spices including chili powder, coriander powder, etc.',10,'img/spices.jpeg');



insert into Restaurant(prodId, prodName,prodPrice,prodDesc, cap, prodImageURL) values
('R1','Chicken Biryani',14.50,'Savory chicken and rice dish that includes layers of chicken, rice, and aromatics.',10,'img/chickenbiryani.jpeg'),
('R2','Bruschetta',8.00,'Slice of garlic bread toasted in the oven topped with olive oil, tomatoes and salt',25,'img/garlicbreadbruschetta.jpeg'),
('R3','Grilled Chicken',12.50,'Juicy chicken breast seasoned and grilled over an open flame',30,'img/grilledchicken.jpeg'),
('R4','Maggi',4.25,'Clasic Indian snack',50,'img/maggi.jpeg'),
('R5','Omelette',6.75,'A dish made by mixing eggs together and frying them',45,'img/omelette.jpeg'),
('R6','Marinara Pasta',14.00,'Pasta tossed in a tomato sauce usually made with tomatoes, garlic, herbs, and onions.',30,'img/pasta.jpeg');

ALTER TABLE SpaceStation ADD survivalTime decimal(5,2);
UPDATE SpaceStation
SET survivalTime = 130.41 WHERE stnId = 'S1';

UPDATE SpaceStation
SET survivalTime = 98.33 WHERE stnId = 'S2';

UPDATE SpaceStation
SET survivalTime = 99.34 WHERE stnId = 'S3';

UPDATE SpaceStation
SET survivalTime = 104.14 WHERE stnId = 'S4';

UPDATE SpaceStation
SET survivalTime = 64.48 WHERE stnId = 'S5';

UPDATE SpaceStation
SET survivalTime = 12.52 WHERE stnId = 'S6';

UPDATE SpaceStation
SET survivalTime = 55.14 WHERE stnId = 'S7';

CREATE TABLE ordersummary (
    servId       INT IDENTITY,
    totalAmount  DECIMAL(10,2),
    Shipname     varchar(100),
    customerId          INT,
    firstname    varchar(50),
    PRIMARY KEY (servId),
    FOREIGN KEY (firstname) REFERENCES Users(firstname)
    ON UPDATE CASCADE ON DELETE CASCADE 
);


select * from services;


select * from SpaceStation;
