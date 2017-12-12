------------------------------CREATE TABLES
create table customer(
customerID int not null auto_increment,
email varchar(20) not null,
phone varchar(20) not null,
dateSignedUp DATE,
constraint customer_pk PRIMARY KEY (customerID)
);

alter table customer auto_increment = 10001;


create table individualCustomer(
customerID int not null,
firstName varchar(20) not null,
lastName varchar(20) not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
zipcode varchar(20) not null,
constraint individualCustomer_pk PRIMARY KEY (customerID),
constraint individualCustomer_fk FOREIGN KEY (customerID) 
REFERENCES customer(customerID) 
);


create table corporateCustomer(
customerID int not null,
coName varchar(20) not null,
constraint corporateCustomer_pk PRIMARY KEY (customerID),
constraint corporateCustomer_fk FOREIGN KEY (customerID) 
REFERENCES customer(customerID) 
);

create table currentCustomer(
customerID int not null,
constraint currentCustomer_pk PRIMARY KEY (customerID),
constraint currentCustomer_fk FOREIGN KEY (customerID) 
REFERENCES customer(customerID) 
);

create table prospectiveCustomer(
customerID int not null,
referredByID int not null,
deadProspect boolean not null default false,
numContacted int default 0,
constraint prospectiveCustomer_fk FOREIGN KEY (customerID) 
REFERENCES customer(customerID),
constraint prospectiveCustomer_fk2 FOREIGN KEY (referredByID) 
REFERENCES currentCustomer(customerID)
);

create table date(
dateContacted date not null,
constraint d_pk primary key(dateContacted)
);

create table dateContacted(
customerID int not null,
dateContacted date not null,
constraint dateContacted_pk primary key(customerID, dateContacted),
constraint dateContacted_fk1 foreign key (customerID)
references prospectiveCustomer(customerID),
constraint dateContacted_fk2 foreign key (dateContacted)
	references date(dateContacted)
);


create table addressType(
type varchar(20) not null,
constraint addressType_pk PRIMARY KEY (type)
);


create table addressLine(
customerID int not null,
type varchar(20) not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
zipcode varchar(20) not null,
constraint addressLine_pk PRIMARY KEY (customerID, type),
constraint addressLine_fk1 FOREIGN KEY (customerID) 
REFERENCES corporateCustomer(customerID),
constraint addressLine_fk2 FOREIGN KEY (type) 
REFERENCES addressType(type)
);



create table steadyCustomer(
customerID int not null,
estMileagePerYear int not null,
loyaltyPoints int default 0, 
constraint steadyCustomer_pk PRIMARY KEY (customerID),
constraint steadyCustomer_fk FOREIGN KEY (customerID) 
REFERENCES currentCustomer(customerID)

);


create table vehicleRepairInterval (
make varchar(20) not null,
model varchar(20) not null,
year int not null,
difficulty varchar(20) not null,
Constraint vehicleRepairInterval_pk 
PRIMARY KEY (make, model, year)
);

create table recommendedInterval (
recommendedIntervalID int not null auto_increment,
make varchar(20) not null,
model varchar(20) not null,
year int not null,
recMileageAmount int not null,
recYearAmount int not null,
constraint RecommendedInterval_pk 
PRIMARY KEY (recommendedIntervalID),
Constraint RecommendedInterval_fk FOREIGN KEY (make,model,year)
REFERENCES vehicleRepairInterval(make, model, year)
);
alter table recommendedInterval auto_increment=40001;


create table emailNotification (
customerID int not null,
recommendedIntervalID int not null,
maintenanceCostEst int not null,
constraint emailNotification_pk PRIMARY KEY (customerID,recommendedIntervalID),
constraint emailNotification_fk1 FOREIGN KEY (customerID) 
REFERENCES steadyCustomer(customerID),
constraint emailNotification_fk2 FOREIGN KEY (recommendedIntervalID) 
REFERENCES recommendedInterval(recommendedIntervalID)
);


create table premierCustomer(
   	 customerID int not null,
	 monthlyInstallment int default 0,
	 discount int default 0,
constraint premierCustomer_pk PRIMARY KEY (customerID),
   	 constraint premierCustomer_fk FOREIGN KEY (customerID) 
  	  	REFERENCES customer(customerID));




CREATE TABLE specialOffer(
    offerName varchar(20) NOT NULL,
    offerDetails varchar(150) NOT NULL,
    CONSTRAINT specialOffer_pk PRIMARY KEY (offerName)
);




CREATE TABLE offerHistory(
    customerID int NOT NULL,
    offerName varchar(20) NOT NULL,
    dateOffered DATE,
    dateAccepted DATE,
    CONSTRAINT offerHistory_pk PRIMARY KEY (customerID, offerName, dateOffered),
    CONSTRAINT offerHistory_fk FOREIGN KEY (customerID) 
    	REFERENCES customer(customerID),
    CONSTRAINT offerHistory_fk2 FOREIGN KEY (offerName)
   	 REFERENCES specialOffer(offerName)
);



Create Table Employee(
 employeeID int not null auto_increment
,
 firstName varchar(20) not null,
 lastName varchar(20) not null,
 phone varchar(20) not null,
 salary int not null,
 dateHired DATE,
 street varchar(20) not null,
 city varchar(20) not null,
 state varchar(20) not null,
 zipcode varchar(20) not null,
 constraint Employee_pk PRIMARY KEY(employeeID) 
);

alter table Employee auto_increment=30001;


Create table Mechanic(
	employeeID int not null,
	masterCertification varchar(20),
	constraint Mechanic_pk PRIMARY KEY (employeeID),
    	constraint Mechanic_fk FOREIGN KEY (employeeID)
REFERENCES Employee(employeeID)
);



CREATE TABLE Skills(
skillName varchar(20) NOT NULL,
Constraint Skills_pk PRIMARY KEY (skillName)
);




CREATE TABLE MechanicSkills(
	employeeID int NOT NULL,
	skillName varchar(20) NOT NULL,
	skillCertification varchar(20) NOT NULL,
Constraint MechanicSkills_pk PRIMARY KEY (employeeID, skillName),
	Constraint MechanicSkills_fk1 FOREIGN KEY (employeeID)
		REFERENCES Mechanic(employeeID),
Constraint MechanicSkills_fk2 FOREIGN KEY (skillName)
		REFERENCES Skills(skillName)
);


CREATE TABLE Mentorship(

menteeID int not null ,
mentorID int not null ,
	skillName varchar(20) not null,
	startDate DATE not null,
	endDate DATE not null,
	Constraint Mentorship_pk PRIMARY KEY (menteeID , mentorID ,skillName , startDate, endDate),
	Constraint Mentorship_fk1 FOREIGN KEY (menteeID)
		REFERENCES Mechanic(employeeID),
        Constraint Mentorship_fk2 FOREIGN KEY (mentorID,skillName)
		REFERENCES MechanicSkills(employeeID,skillName)

);


create table serviceTechnician(
employeeID int not null,
constraint serviceTechnician_pk PRIMARY KEY (employeeID),
constraint serviceTechnician_fk FOREIGN KEY (employeeID)
references Employee(employeeID)
);



create table vehicle(
customerID int not null,
make varchar(20) not null,
model varchar(20) not null,
year int not null,
vin varchar(20) not null,
plateNum varchar(20) not null,
yearlyMileageEstimate int not null,
dateEstimate date,
Constraint vehicle_pk PRIMARY KEY (vin),
Constraint vehicle_fk1 FOREIGN KEY (customerID)
	REFERENCES customer(customerID),
Constraint vehicle_fk2 FOREIGN KEY (make,model,year)
	REFERENCES vehicleRepairInterval(make,model,year)
);



create table maintenanceVisit(
visitID  int not null auto_increment,
vin varchar(20) not null,
visitDate date not null,
visitTime time not null,
serviceTechnicianID int not null,
Actualmileage int,
maintenanceVisitCost int default 0,
Constraint maintenanceVisit_pk PRIMARY KEY (visitID),
Constraint maintenanceVisit_fk1 FOREIGN KEY (vin)
	REFERENCES vehicle(vin),
Constraint maintenanceVisit_fk2 FOREIGN KEY (serviceTechnicianID)
	REFERENCES serviceTechnician(employeeID)
);

alter table maintenanceVisit auto_increment = 80001;




create table maintenanceAction(
actionID int not null auto_increment,
actionCost int not null,
constraint maintenanceAction_pk primary key (actionID)
);
ALTER TABLE maintenanceAction auto_increment = 60001;






Create table MaintenanceAction_VehicleRepairInterval(

make varchar(20) not null,
model varchar(20) not null,
year int not null,
actionID int not null,

constraint maintenanceAction_pk primary key(make,model,year,actionID),
Constraint maintenanceAction_fk1 FOREIGN KEY (make,model,year)
	REFERENCES vehicleRepairInterval(make,model,year),
Constraint maintenanceAction_fk2 FOREIGN KEY (actionID)
	REFERENCES maintenanceAction(actionID)
);



create table maintenanceItem(
actionID int NOT NULL,
serviceName varchar(40) NOT NULL,
numOfRequiredMechanics int NOT NULL,
constraint maintenanceItem_pk primary key (actionID),
constraint maintenanceItem_fk1 foreign key (actionID)
references maintenanceAction(actionID)
);



create table taskSequence(
firstItem int  NOT NULL,
nextItem int  NOT NULL,

constraint taskSequence_pk primary key (firstItem , nextItem),
constraint taskSequence_fk1 foreign key (firstItem)
references maintenanceItem(actionID),
constraint taskSequence_fk2 foreign key (nextItem)
references maintenanceItem(actionID)

);

create table visitService(
listID int not null AUTO_INCREMENT,
visitID int NOT NULL,
actionID int not null,

constraint visitService_pk primary key (listID),
constraint visitService_fk1 foreign key (visitID)
references maintenanceVisit(visitID),
constraint visitService_fk2 foreign key (actionID)
references maintenanceAction(actionID)
);
ALTER TABLE visitService AUTO_INCREMENT = 90001;



------------------------------------------------
create table itemSkills(
actionID int NOT NULL,
skillName varchar(20) NOT NULL,
constraint itemSkills_pk primary key (actionID ,skillName ),
constraint itemSkills_fk1 foreign key (skillName)
references Skills(skillName),
constraint itemSkills_fk2 foreign key (actionID)
references maintenanceItem(actionID)

);


create table MechanicTask(
employeeID int NOT NULL,
skillName varchar(20) not null,
listID int not null,

constraint MechanicTask_pk primary key (employeeID,skillName, listID),

constraint MechanicTask_fk1 foreign key (employeeID,skillName)
references MechanicSkills(employeeID,skillName),

constraint MechanicTask_fk2 foreign key(listID)
references visitService(listID)
);




create table maintenancePackage(
actionID int NOT NULL,
packageName varchar(50) NOT NULL,
constraint maintenancePackage_pk primary key (actionID,packageName),
constraint maintenancePackage_fk foreign key (actionID)
references maintenanceAction(actionID)
);







create table packageItem(
itemID int NOT NULL,
packageID int not null,
constraint packageItem_pk primary key (itemID,packageID),
constraint packageItem_fk1 foreign key (packageID)
references maintenancePackage(actionID),
constraint packageItem_fk2 foreign key (itemID)
references maintenanceItem(actionID)
);




Create table CustomerVehicleRecommendedInterval(

vin varchar(20) NOT NULL,
recommendedIntervalID int not null,

constraint CustomerVehicleRecommendedInterval_pk primary key (vin,recommendedIntervalID ),
constraint CustomerVehicleRecommendedInterval_fk1 foreign key (vin )
references vehicle(Vin),
constraint CustomerVehicleRecommendedInterval_fk2 foreign key (recommendedIntervalID)
references recommendedInterval(recommendedIntervalID)
);



create table MechanicTask_With_Skill(
employeeID int NOT NULL,
listID int  NOT NULL,
MTskillName varchar(20) not null,
actionID int not null,
skillName varchar(20) not null,

constraint MechanicTask_With_Skill_pk primary key (employeeID, MTskillName, listID, actionID, skillName),

constraint MechanicTask_With_Skill_fk1 foreign key (employeeID, MTskillName, listID)
    references MechanicTask (employeeID, skillName, listID),

constraint MechanicTask_With_Skill_fk2 foreign key (actionID , skillName)
references itemSkills (actionID, skillName)
);
