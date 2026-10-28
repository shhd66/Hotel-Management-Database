-- Create Database
CREATE DATABASE HotelDB;
USE HotelDB;

-- ======================
-- Tables
-- ======================

CREATE TABLE Hotels (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    HotelName VARCHAR(100),
    City VARCHAR(100),
    Rating INT
);

CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    RoomNumber VARCHAR(10),
    RoomType VARCHAR(50),
    Price DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Guests (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100)
);

CREATE TABLE HotelServices (
    HotelID INT,
    ServiceID INT,
    PRIMARY KEY (HotelID, ServiceID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- ======================
-- Insert Data
-- ======================

-- Hotels 
INSERT INTO Hotels (HotelName, City, Rating) VALUES
('Nile Palace Hotel','Cairo',5),
('Red Sea Resort','Hurghada',4),
('Luxor Oasis','Luxor',4),
('Alex Beach Hotel','Alexandria',3),
('Desert Rose','Aswan',5),
('Golden Pyramids','Giza',5),
('Blue Lagoon','Cairo',4),
('Coral Bay','Sharm El Sheikh',5),
('Sunrise Hotel','Marsa Alam',4),
('Royal Stay','Cairo',3),
('Green Valley','Alexandria',3),
('Sea Breeze','Port Said',4),
('Palm Resort','Aswan',5),
('Crystal Inn','Hurghada',3),
('Elite Suites','Alexandria',4);

-- Rooms 
INSERT INTO Rooms (HotelID, RoomNumber, RoomType, Price, Status) VALUES
(1,'101','single',500,'available'),
(1,'102','double',800,'booked'),
(1,'103','suite',1500,'maintenance'),
(2,'201','single',400,'available'),
(2,'202','double',700,Null),
(3,'301','suite',1200,'available'),
(4,'401','single',350,'Unknown'),
(5,'501','double',900,'booked'),
(6,'601','suite',2000,'Unknown'),
(7,'701','single',450,'available'),
(8,'801','double',1000,'booked'),
(9,'901','suite',1800,'available'),
(10,'1001','single',300,'Unknown'),
(11,'1101','double',600,'maintenance'),
(12,'1201','suite',1300,Null);

-- Guests 
INSERT INTO Guests (FullName, Phone, Email) VALUES
('ahmed mohamed','01000000001','ahmed1@mail.com'),
('sara ali','01000000002','sara@mail.com'),
('mohamed hassan','01000000003','mohamed@mail.com'),
('fatma ibrahim','01000000004','fatma@mail.com'),
('youssef khaled','01000000005','youssef@mail.com'),
('omar nasser','01000000006','omar@mail.com'),
('nour gamal','01000000007','nour@mail.com'),
('hassan ali','01000000008','hassan@mail.com'),
('mona said','01000000009','mona@mail.com'),
('khaled fathy','01000000010','khaled@mail.com'),
('adel ibrahim','01000000011','adel@mail.com'),
('reem tamer','01000000012','reem@mail.com'),
('salma ahmed','01000000013','salma@mail.com'),
('mostafa saad','01000000014','mostafa@mail.com'),
('dina sameh','01000000015','dina@mail.com');

-- Employees 
INSERT INTO Employees (FullName, JobTitle, Salary, HotelID) VALUES
('hassan ali','manager',10000,1),
('mona said','receptionist',4000,1),
('khaled omar','chef',6000,2),
('nour gamal','cleaner',3000,3),
('adel fathy','security',3500,4),
('omar nasser','manager',9000,1),
('salma ahmed','receptionist',4200,6),
('youssef khaled','chef',6500,7),
('fatma ali','cleaner',2800,8),
('ahmed said','security',3600,9),
('mohamed ibrahim','manager',9500,1),
('reem tamer','receptionist',4100,11),
('dina sameh','chef',6200,12),
('mostafa saad','security',3700,13),
('nada ali','cleaner',2900,14);

-- Bookings 
INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate) VALUES
(1,2,'2026-05-01','2026-05-05'),
(2,5,'2026-05-02','2026-05-06'),
(3,8,'2026-05-03','2026-05-07'),
(4,11,'2026-05-04','2026-05-08'),
(5,14,'2026-05-05','2026-05-09'),
(6,1,'2026-05-06','2026-05-10'),
(7,3,'2026-05-07','2026-05-11'),
(8,4,'2026-05-08','2026-05-12'),
(9,6,'2026-05-09','2026-05-13'),
(10,7,'2026-05-10','2026-05-14'),
(11,9,'2026-05-11','2026-05-15'),
(12,10,'2026-05-12','2026-05-16'),
(13,12,'2026-05-13','2026-05-17'),
(14,13,'2026-05-14','2026-05-18'),
(15,15,'2026-05-15','2026-05-19');

-- Payments 
INSERT INTO Payments (BookingID, Amount, PaymentDate, PaymentMethod) VALUES
(1,3200,'2026-05-01','cash'),
(2,2800,'2026-05-02','visa'),
(3,3000,'2026-05-03','cash'),
(4,4000,'2026-05-04','visa'),
(5,3500,'2026-05-05','cash'),
(6,2000,'2026-05-06','visa'),
(7,4500,'2026-05-07','cash'),
(8,1800,'2026-05-08','visa'),
(9,2200,'2026-05-09','cash'),
(10,2600,'2026-05-10','visa'),
(11,5000,'2026-05-11','cash'),
(12,2100,'2026-05-12','visa'),
(13,3300,'2026-05-13','cash'),
(14,2900,'2026-05-14','visa'),
(15,3100,'2026-05-15','cash');

-- Services 
INSERT INTO Services (ServiceName) VALUES
('wifi'),('spa'),('gym'),('pool'),('restaurant'),
('parking'),('bar'),('laundry'),('room service'),
('airport shuttle'),('conference room'),('kids area'),
('private beach'),('fitness center'),('casino');

-- HotelServices 
INSERT INTO HotelServices (HotelID, ServiceID) VALUES
(1,1),(1,2),(1,4),(1,5),(1,9),
(2,1),(2,3),(2,6),(2,8),(2,10),
(3,1),(3,5),(3,7),(3,11),(3,12),
(4,1),(5,2),(6,3),(7,4),(8,5);