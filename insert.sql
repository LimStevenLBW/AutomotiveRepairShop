----------------------INSERT TABLES

INSERT INTO customer(email, phone, dateSignedUp) values
	('one@gmail.com', '111-111-1111', '2000-01-01'),
('two@gmail.com', '222-222-2222', '2002-02-02'),
	('three@gmail.com', '333-333-3333', '2003-03-03'),
	('four@gmail.com', '444-444-4444', '2004-04-04'),
	('five@gmail.com', '555-555-5555', '2005-05-05'),
	('six@gmail.com', '666-666-6666', '2006-06-06'),
	('seven@gmail.com', '777-777-7777', '2007-07-07'),
	('eight@gmail.com', '888-888-8888', '2008-08-08'),
	('nine@gmail.com', '999-999-9999', '2009-09-09'),
('ten@gmail.com', '101-101-1010', '2010-10-10');

-- First 5 customers are individual, the next 5 are corporate
-- Customers 2-8 are Current, Customers 1, 9, 10 are Prospective


INSERT INTO individualCustomer(customerID, firstName, lastName, street, city, state, zipcode) values
	(10001,'Individual1', 'One', '11 Street','One City', 'One State', '11111'),
	(10002,'Individual2', 'Two', '22 Street', 'Two City', 'Two State', '22222'),
	(10003, 'Individual3', 'Three', '33 Street', 'Three City', 'Three State', '33333'),
	(10004, 'Individual4', 'Four', '44 Street', 'Four City', 'Four State', '44444'),
	(10005,'Individual5', 'Five', '55 Street', 'Five City', 'Five State', '55555');


INSERT INTO corporateCustomer(customerID, coName) values
	(10006,'Company 1'),
	(10007,'Company 2'),
	(10008,'Company 3'),
	(10009,'Company 4'),
	(10010,'Company 5');


INSERT INTO currentCustomer(customerID) values
	(10002),
	(10003),
	(10004),
(10005),
	(10006),
(10007),
(10008);


INSERT INTO prospectiveCustomer(customerID, referredByID) values
	(10001, 10002),
(10002, 10004),
(10003, 10005);


INSERT INTO date(dateContacted) values 
('2014-02-02'),
('2015-02-03'),
('2015-02-04'),
('2017-02-05'),
('2017-02-06'),
('2017-02-07');


INSERT INTO dateContacted(customerID, dateContacted) values
(10001,'2014-02-02'),
(10001,'2015-02-03'),
(10001,'2015-02-04'),

(10002,'2014-02-02'),
(10002,'2015-02-03'),
(10002,'2015-02-04'),
(10002,'2017-02-05'),
(10002,'2017-02-06'),
(10002,'2017-02-07'),

(10003,'2014-02-02'),
(10003,'2015-02-03'),
(10003,'2015-02-04');


INSERT INTO addressType(type) values
	('mailing'),
('billing'),
	('office'),
	('shipping');


INSERT INTO addressLine(customerID,  type, street, city, state, zipcode) values
	(10006,'mailing', '66 Street', 'Sixth City','Sixth State', '66666' ),
(10006,'office', '67 Ave', 'Sixth City','Sixth State', '66666' ),
(10007,'billing', '77 Street', 'Seventh City','Seventh State', '77777' ),
	(10008,'shipping', '88 Street', 'Eighth City','Eighth State', '88888' ),
(10008,'office', '89 Street', 'Eighth City','Eighth State', '88888' ),
	(10009,'shipping', '99 Street', 'Ninth City','Ninth State', '99999' ),
	(10010,'office', '10 Street', 'Tenth City','Tenth State', '10110' );


INSERT INTO steadyCustomer(customerID, estMileagePerYear) values
	(10008, 10000),
(10002, 20000),
	(10003, 30000);


INSERT INTO vehicleRepairInterval (make ,model,year, difficulty) values
('Toyota','Camry', 2001, 'easy'),
('Toyota','Corolla', 2002, 'easy'),
('Toyota','Yaris', 2003, 'medium'),
('Honda','Civic', 2002, 'easy'),
('Honda','Accord', 2005, 'easy'),
('Honda','Fit', 2006, 'medium'),
('Chevrolet','Camero', 2007, 'medium'),
('Chevrolet','Cruze', 2003, 'hard'),
('Chevrolet','Spark', 2009 ,'hard'),
('Chevrolet','Corvett', 2010, 'hard');


INSERT INTO recommendedInterval(make, model, year, recYearAmount , recMileageAmount ) values
('Toyota','Camry', 2001, 1, 50000),
('Honda','Civic', 2002, 2, 60000),
('Toyota','Corolla', 2002,1, 50000),
('Toyota','Yaris', 2003, 1, 60000),
('Honda','Accord', 2005, 1, 50000),
('Honda','Fit', 2006,2 , 75000),
('Chevrolet','Camero',2007,2, 80000),
('Chevrolet','Cruze', 2003, 2, 90000),
('Chevrolet','Spark', 2009, 2, 70000),
('Chevrolet', 'Corvett', 2010, 3, 80000);




INSERT INTO emailNotification (customerID ,recommendedIntervalID ,maintenanceCostEst  ) values
	(10008,40001, 1000 ),
	(10008,40002, 500 ),
        	(10002,40003, 2000 );

INSERT INTO premierCustomer(customerID ) values
	(10004),
(10005),
	(10006),
	(10007);


INSERT INTO specialOffer(offerName ,offerDetails) VALUES
   	 ('discount','reduce price for next maintenance by 20%' ),
    	('coupon','$50 gifted for premier customers for recommending others' ),
    	('oil-change', 'free oil change for steady customers who refer prospective customers' );


INSERT INTO offerHistory(customerID, offerName, dateOffered, dateAccepted) VALUES
    (10002, 'oil-change', '2000-12-01', '2000-12-20'),
    (10003, 'oil-change', '2000-11-26', '2000-12-05'),
    (10004, 'coupon', '2001-01-01', '2001-01-10');



INSERT INTO Employee(firstName,lastName ,phone ,salary,dateHired,street ,city ,state,zipcode) values
( 'emp1FirstName','emp1LastName' ,'emp1Phone' ,1000,'2011-01-01','emp1 Street ' ,'emp1 City' ,'emp1 state','11100'),
('emp2FirstName','emp2LastName' ,'emp2Phone' ,2000,'2012-02-02','emp2 Street ' ,'emp2 City' ,'emp2 state','22200'),
( 'emp3FirstName','emp3LastName' ,'emp3Phone' ,1000,'2013-03-03','emp3 Street ' ,'emp3 City' ,'emp3state','33300'),
('emp4FirstName','emp4LastName' ,'emp4Phone' ,2000,'2014-04-04','emp4 Street ' ,'emp4 City' ,'emp4 state','44400'),
('emp5FirstName','emp5LastName' ,'emp5Phone' ,2000,'2015-05-05','emp5 Street ' ,'emp5 City' ,'emp5 state','55500'),

----
('emp6FirstName','emp6LastName' ,'emp6Phone' ,3000,'2016-06-06','emp6 Street' ,'emp6 City' ,'emp6 state','66600'),
('emp7FirstName','emp7LastName' ,'emp7Phone' ,4000,'2017-07-07','emp7 Street' ,'emp7 City' ,'emp7 state','77700'),
----
('emp8FirstName','emp8LastName' ,'emp8Phone' ,2000,'2015-03-03', 'That Street ', 'emp8 City' ,'emp8state','33300'),
('emp9FirstName','emp9LastName' ,'emp9Phone' , 2000,'2016-08-04', 'Other Street ', 'emp9 City' ,'emp9 state','44400'),
('emp10FirstName','emp10LastName' ,'emp10Phone', 3000, '2017-05-05', 'Some Street', 'emp10 City' ,'emp10 state','55500');


INSERT INTO Mechanic(employeeID, masterCertification) values
(30001, 'yes'),
(30002, 'yes'),
(30003, 'no'),
(30004, 'no'),
(30005, 'no'),

(30008, 'no'),
(30009, 'no'),
(30010, 'yes');



INSERT INTO Skills(skillName) values
('Oil change'),
('Tire change'),
('Smog check'),
('Repaint Car'),
('Change Car Glass'),
('Battery Replacing'),
('Wheel Alignment'),
('Engine Cleaning'),
('Software Upgrading'),
('Headlight Replacing'),
('Bumper Replacing');


INSERT INTO MechanicSkills(employeeID,skillName,skillCertification) values
(30001, 'Oil change', 'yes'),
(30001, 'Tire change', 'yes'),
(30001, 'Repaint Car', 'yes'),
(30001, 'Change Car Glass', 'yes'),

(30002, 'Tire change', 'yes'),
(30002, 'Repaint Car', 'yes'),
(30002, 'Change Car Glass', 'yes'),

(30003, 'Smog check', 'yes'),
(30004, 'Repaint Car', 'No'),
(30004, 'Change Car Glass', 'No'),
(30005, 'Change Car Glass', 'No'),

(30009, 'Smog check', 'yes'),
(30009, 'Repaint Car', 'yes'),
(30009, 'Oil change', 'yes'),
(30009, 'Engine Cleaning', 'yes'),
(30010, 'Change Car Glass', 'yes'),
(30010, 'Bumper Replacing', 'yes'),
(30010, 'Headlight Replacing', 'yes'),
(30010, 'Wheel Alignment', 'yes');




INSERT INTO Mentorship(menteeID, mentorID , skillName , startDate, endDate) values
(30008,30001,'Tire change','2017-04-02','2017-07-02'),
(30008,30001,'Repaint Car','2017-04-02','2017-07-02'),
(30008,30010,'Wheel Alignment','2017-04-02','2017-07-02');

	
INSERT INTO serviceTechnician(employeeID ) values
(30006),
(30007),
(30010);


INSERT INTO vehicle(customerID, make, model, year, vin, plateNum , yearlyMileageEstimate, dateEstimate) values
(10001,'Toyota','Camry', 2001,'50001','AAAAAAA',50000, '0000-00-00'),
(10002,'Honda','Civic', 2002,'50002','BBBBBBB',50000, '0000-00-00'),
(10003,'Chevrolet','Cruze', 2003,'50003','CCCCCCC',50000, '0000-00-00'),
(10004,'Toyota','Yaris', 2003,'50004','DDDDDDD',50000, '0000-00-00'),
(10005,'Honda','Fit', 2006,'50005','EEEEEEE',50000, '0000-00-00'),
(10006,'Honda','Accord', 2005,'50006','FFFFFFF',50000, '0000-00-00'),
(10007,'Toyota','Camry', 2001,'50007','GGGGGGG',50000, '0000-00-00'),
(10008,'Chevrolet','Camero',2007,'50008','HHHHHHH',50000, '0000-00-00'),
(10009, 'Toyota','Corolla', 2002,'50009','IIIIIII',50000, '0000-00-00'),
(10010,'Chevrolet','Spark', 2009,'50010','JJJJJJJ',50000, '0000-00-00'),
(10010,'Chevrolet', 'Corvett', 2010,'50011','KKKKKKK',50000, '0000-00-00');




INSERT INTO maintenanceVisit(vin, visitDate ,visitTime, serviceTechnicianID,Actualmileage) values

('50001','2017-02-02','07:00:00',30006,10000),
('50002','2017-03-03','07:00:00',30006,20000),
('50003','2017-04-04','07:00:00',30007,30000),
('50004','2017-02-02','07:00:00',30006,10000),
('50005','2017-03-03','07:00:00',30006,20000),
('50006','2017-04-04','07:00:00',30007,30000),
('50007','2017-02-02','07:00:00',30006,10000),
('50008','2017-03-03','07:00:00',30006,20000),
('50009','2017-04-04','07:00:00',30010,30000),
('50010','2017-04-04','07:00:00',30010,30000),
('50011','2017-04-04','07:00:00',30010,30000);


INSERT INTO maintenanceAction(actionCost) values
(100),
(200),
(300),
(400),

(500),
(600),
(700),
(1000);

INSERT INTO visitService (visitID,actionID) values
(80001,60001),
(80001, 60003), 
(80002, 60006), 
(80002, 60007), 
(80002, 60005),
(80003, 60006),
(80003, 60007), 
(80003, 60005), 
(80004, 60007),
(80005, 60008),
(80006, 60003), 
(80007, 60001), 
(80008,60006),
(80009, 60007),
(80010, 60007),
(80011, 60001),
(80011, 60002), 
(80011, 60003),
(80011, 60004);




INSERT INTO MaintenanceAction_VehicleRepairInterval
(make,model,year,actionID) values
('Toyota','Camry', 2001,60001),
('Toyota','Camry', 2001,60002),
('Toyota','Camry', 2001,60003),

('Honda','Civic', 2002,60006),
('Honda','Civic', 2002,60007),

('Chevrolet','Cruze', 2003,60001),
('Chevrolet','Cruze', 2003,60002),
('Chevrolet','Cruze', 2003,60003),
('Chevrolet','Cruze', 2003,60006),
('Chevrolet','Cruze', 2003,60007);


INSERT INTO maintenanceItem(actionID, serviceName, numOfRequiredMechanics) values
(60001,'Oil Change Service', 1),
(60002,'Tire change Service', 2),
(60003,'Smog check Service', 3),
(60004,'Repaint Car Service', 4),
(60005,'Change Car Glass Service', 5);


INSERT INTO taskSequence(firstItem  ,nextItem  ) values
(60001, 60002),
(60001,60003),
(60002,60004),
(60002, 60005);

INSERT INTO itemSkills(actionID ,skillName) values
(60001, 'Oil change'),
(60002,'Tire change'),
(60003,'Smog check'),
(60004, 'Repaint Car'),
(60005,'Change Car Glass');


INSERT INTO MechanicTask(employeeID, skillName, listID) values

(30001,'Oil change', 90001),
(30001,'Oil change', 90002),
(30001,'Oil change',  90003),
(30001,'Oil change', 90004),
(30001,'Oil change', 90005),
(30001,'Oil change',90006),

(30002,'Tire change', 90007),
(30002,'Tire change', 90008),
(30002,'Tire change', 90009),
(30002,'Tire change', 90010),

(30003,'Smog check', 90011),
(30003,'Smog check', 90012),
(30003,'Smog check', 90013),
(30003,'Smog check', 90014),
(30003,'Smog check', 90015),
(30003,'Smog check', 90016),
(30003,'Smog check', 90017),
(30003,'Smog check', 90018),
(30003,'Smog check', 90019);



INSERT INTO maintenancePackage(actionID, packageName) values
	(60006, 'Oil and Tire Change'),
	(60007, 'Smog Check and Repaint'),
	(60008, 'Complete Service');


INSERT INTO packageItem(packageID,itemID) values
	(60006,60001),
	(60006,60002),
       
	(60007,60003),
	(60007,60004),

	(60008, 60001),
	(60008, 60002),
	(60008, 60003),
		(60008, 60004),
		(60008, 60005);



INSERT INTO CustomerVehicleRecommendedInterval(vin, recommendedIntervalID) values
('50001',40001),
('50002',40002),
('50003',40003);


INSERT INTO MechanicTask_With_Skill(employeeID, MTskillName, listID, actionID, skillName) values

(30001,'Oil change', 90001, 60001,'Oil change'),
(30001,'Oil change', 90002, 60003,'Oil change'),
(30001,'Oil change',  90003, 60006,'Oil change'),
(30001,'Oil change', 90004, 60007,'Oil change'),
(30001,'Oil change', 90005, 60005,'Oil change'),
(30001,'Oil change',90006, 60006,'Oil change'),

(30002,'Tire change', 90007, 60007,'Tire change'),
(30002,'Tire change', 90008, 60005,'Tire change'),
(30002,'Tire change', 90009, 60007,'Tire change'),
(30002,'Tire change', 90010,  60008,'Tire change'),

(30003,'Smog check', 90011, 60003,'Smog check'),
(30003,'Smog check', 90012, 60001,'Smog check'),
(30003,'Smog check', 90013, 60006,'Smog check'),
(30003,'Smog check', 90014, 60007,'Smog check'),
(30003,'Smog check', 90015, 60007,'Smog check'),
(30003,'Smog check', 90016, 60001,'Smog check'),
(30003,'Smog check', 90017, 60002,'Smog check'),
(30003,'Smog check', 90018, 60003,'Smog check'),
(30003,'Smog check', 90019, 60004,'Smog check');


