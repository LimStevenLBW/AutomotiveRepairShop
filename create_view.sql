--VIEWS
--1. Customer_v – for each customer, indicate his or her name as well as the customer type (prospect, steady or premier) as well as the number of years that customer has been with us. 
CREATE VIEW Customer_v AS
    (SELECT firstName, lastName, 'NA' AS CompanyName, 'PremierCustomer' AS CustomerType, YEAR(CURDATE()) - YEAR(dateSignedUP) AS YearsWithDave
    FROM premierCustomer 
    INNER JOIN customer ON premierCustomer.customerID = customer.customerID
    INNER JOIN individualCustomer ON premierCustomer.customerID = individualCustomer.customerID)
        UNION 
    (SELECT 'NA', 'NA', coName, 'PremierCustomer' AS CustomerType, YEAR(CURDATE()) - YEAR(dateSignedUP) AS YearsWithDave
    FROM premierCustomer 
    INNER JOIN customer ON premierCustomer.customerID = customer.customerID
    INNER JOIN corporateCustomer ON premierCustomer.customerID = corporateCustomer.customerID)
        UNION  
    (SELECT firstName, lastName,'NA', 'SteadyCustomer', YEAR(CURDATE()) - YEAR(dateSignedUP) 
    FROM steadyCustomer 
    INNER JOIN customer ON steadyCustomer.customerID = customer.customerID
    INNER JOIN individualCustomer ON steadyCustomer.customerID = individualCustomer.customerID)
        UNION 
    (SELECT 'NA', 'NA',coName, 'SteadyCustomer', YEAR(CURDATE()) - YEAR(dateSignedUP) 
    FROM steadyCustomer 
    INNER JOIN customer ON steadyCustomer.customerID = customer.customerID
    INNER JOIN corporateCustomer ON steadyCustomer.customerID = corporateCustomer.customerID)
        UNION
    (SELECT firstName, lastName,'NA', 'ProspectiveCustomer', YEAR(CURDATE()) - YEAR(dateSignedUP) 
    FROM prospectiveCustomer
    INNER JOIN customer ON prospectiveCustomer.customerID = customer.customerID
    INNER JOIN individualCustomer ON prospectiveCustomer.customerID = individualCustomer.customerID)
        UNION
    (SELECT 'NA', 'NA',coName, 'ProspectiveCustomer', YEAR(CURDATE()) - YEAR(dateSignedUP) 
    FROM prospectiveCustomer
    INNER JOIN customer ON prospectiveCustomer.customerID = customer.customerID
    INNER JOIN corporateCustomer ON prospectiveCustomer.customerID = corporateCustomer.customerID);


--2. Customer_addresses_v – for each customer, indicate whether they are an individual or a corporate account, and display all of the addresses that we are managing for that customer. 

CREATE VIEW Customer_addresses_v AS

(SELECT i.lastName, i.firstName, 'N/A' as coName, 'IndividualCustomer' AS ContactType, 'Home' as AddressType, i.street, i.city, i.state, i.zipcode
    FROM individualCustomer i 
)
    UNION

(SELECT 'N/A' as lastName, 'N/A' as firstName, c.coName, 'CorporateCustomer', a.type, a.street, a.city, a.state, a.zipcode
    FROM corporateCustomer c 
    INNER JOIN addressLine a ON c.customerID = a.customerID
);

--3. Mechanic_mentor_v – reports all of the mentor/mentee relationships at Dave’s, sorted by the name of the mentor, then the name of the mentee. 

CREATE VIEW Mechanic_mentor_v AS
(SELECT  a.lastName as MentorLastName, a.firstName as MentorFirstName, b.lastName as MenteeLastName,b.firstName as MenteeFirstName, m.skillName, m.startDate, m.endDate
    FROM Employee a 
    INNER JOIN Mentorship m ON a.employeeID = m.mentorID
    INNER JOIN Employee b ON b.employeeID = m.menteeID
    ORDER BY a.lastName);

--4. Premier_profits_v – On a year by year basis, show the premier customer’s outlay versus what they would have been charged for the services which they received had they merely been steady customers. 
/*
CREATE VIEW Premier_profits_v AS
SELECT customerID, () AS MoneySaved FROM 

//shows the annual payment made by a premier customer
SELECT (monthlyInstallment*12) AS AnnualPayment FROM premierCustomer
//shows the totalcost of vsits made by a premier customer	
SELECT SUM(actionCost) FROM MaintenanceAction
INNER JOIN 
(sum(totalcost)) - (monthlyInstallment*12)
Yearly cost - total cost of all the things
*/
-- not done

--5. Prospective_resurrection_v – List all of the prospective customers who have had three or more contacts, and for whom the most recent contact was more than a year ago. They might be ripe for another attempt.

CREATE VIEW Prospective_resurrection_v AS
SELECT distinct customerID IN
    (SELECT customerID FROM dateContacted
    GROUP BY customerID
    HAVING COUNT(customerID) >= 3),
    dateContacted
FROM dateContacted
WHERE dateContacted < '2017'
ORDER BY dateContacted DESC;

--DISPLAY VIEWS
SELECT * from Customer_v;
SELECT * from Customer_addresses_v;
SELECT * from Mechanic_mentor_v;
--SELECT * from Premier_profits_v ;
SELECT * from  Prospective_resurrection_v;