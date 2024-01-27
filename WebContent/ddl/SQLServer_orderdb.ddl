CREATE DATABASE SpaceBank;
USE SpaceBank;
DROP TABLE IF EXISTS SpaceStation;
DROP TABLE IF EXISTS User;

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

CREATE TABLE User(
name varchar(50),
stnId char(2),
pwd varchar(30),
sbucks int,
PRIMARY KEY(name),
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


INSERT INTO User(name,stnId,pwd,sbucks) values
('Mithish','S3','Mithish123@',800000),
('Pratham','S5','Pratham123@',920000),
('Mahi','S1','Mahi123@',919999),
('Sparsh','S2','Sparsh123@',400);
