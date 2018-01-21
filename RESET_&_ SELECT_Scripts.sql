-- ====================================================================
-- SQL Script for Facilities Services of The College of St Scholastica Reset Script
--    This script will drop and then re-create the tables for the
--    Facilities Services database. 
--
--	Created by: Jennifer Vang, Jordan Lyaruu
--	Created on: 12/10/2017
--  Modified by: Glander Madondo
--	Modified on: 12/13/2017 
-- ====================================================================

-- DROP all tables from previous uses of Facilities Services Database
IF OBJECT_ID ('lov')		IS NOT NULL     DROP TABLE lov;
IF OBJECT_ID ('employee')	IS NOT NULL     DROP TABLE employee;
IF OBJECT_ID ('work_list')	IS NOT NULL     DROP TABLE work_list;
IF OBJECT_ID ('building')	IS NOT NULL     DROP TABLE building;
IF OBJECT_ID ('work_order')	IS NOT NULL     DROP TABLE work_order;
IF OBJECT_ID ('schedule')	IS NOT NULL     DROP TABLE schedule;
IF OBJECT_ID ('requester')	IS NOT NULL     DROP TABLE requester;
 
 -- Create the requester table 
CREATE TABLE requester (
    req_id          VARCHAR(10)	NOT NULL	UNIQUE,
	building_id	    VARCHAR(10),
	req_fname	    VARCHAR(20),
	req_lname	    VARCHAR(20),
	req_phone	    CHAR(12),
	req_email	    VARCHAR(25),
    req_type        CHAR(1)      NOT NULL,
PRIMARY KEY(req_id)
);

--create requester records
INSERT INTO requester VALUES
('50000','20000','Michelle','Johns','2185932659','mjohnson@css.edu','S');
INSERT INTO requester VALUES
('50001','20001','Makayla','Jonas','6135932222','mjonas@css.edu','O');
INSERT INTO requester VALUES
('50002','20002','Brian','Smith','4327892779','bsmith@css.edu','S');
INSERT INTO requester VALUES
('50003','20003','Remy','Johns','9158975588','rjohns@css.edu','E');
INSERT INTO requester VALUES
('50004','20004','George','Bush','2185590047','gbush@css.edu','S');
INSERT INTO requester VALUES
('50005','20005','Sylas','Charleston','251889396','acharleston@css.edu','S');
INSERT INTO requester VALUES
('50006','20006','Tim','Messa','5187985859','tmessa@css.edu','e');
INSERT INTO requester VALUES
('50007','20007','Saraj','Wilkins','2182290369','swilkins@css.edu','S');

 -- Create the schedule table 
CREATE TABLE schedule (
    schedule_num    VARCHAR(10)	NOT NULL     UNIQUE,
	req_id	        VARCHAR(10) NOT NULL,
	wo_num          VARCHAR(10) NOT NULL,
	building_id	    VARCHAR(20) NOT NULL,
	requested_date	DATETIME,
PRIMARY KEY(schedule_num)
);

--create schedule records
INSERT INTO schedule VALUES
('60000','50000','70000','20000','01-DEC-2017');
INSERT INTO schedule VALUES
('60001','50001','70001','20001','05-DEC-2017');
INSERT INTO schedule VALUES
('60002','50002','70002','20002','04-DEC-2017');
INSERT INTO schedule VALUES
('60003','50003','70003','20003','10-DEC-2017');
INSERT INTO schedule VALUES
('60004','50004','70004','20004','11-DEC-2017');
INSERT INTO schedule VALUES
('60005','50005','70005','20005','02-DEC-2017');
INSERT INTO schedule VALUES
('60006','50006','70006','20006','11-DEC-2017');
INSERT INTO schedule VALUES
('60007','50007','70007','20007','09-DEC-2017');

 -- Create the work_order table 
 CREATE TABLE work_order(
    wo_num              VARCHAR(10)	NOT NULL     UNIQUE,
	wo_start_date	    DATETIME    NOT NULL,
	wo_end_date         DATETIME    NOT NULL,
	wo_status           CHAR(1) NOT NULL,
	wo_description      VARCHAR(100) NOT NULL,
	created_datetime    DATETIME    NOT NULL,
	created_by          VARCHAR(25) NOT NULL,
	modified_datetime   DATETIME    NOT NULL,
	modified_by         VARCHAR(25) NOT NULL,
PRIMARY KEY(wo_num)
);
 
 --create work order records
 INSERT INTO work_order VALUES
 ('70000','02-DEC-2017','04-DEC-2017','D','Change light bulbs','02-DEC-2017','fmicken','04-DEC-2017','tsimons');
  INSERT INTO work_order VALUES
 ('70001','07-DEC-2017','','D','Fix Dryer in laundry room','07-DEC-2017','fmicken','','');
  INSERT INTO work_order VALUES
 ('70002','05-DEC-2017','08-DEC-2017','D','Fix Printer','05-DEC-2017','fmicken','08-DEC-2017','tsimons');
  INSERT INTO work_order VALUES
 ('70003','11-DEC-2017','15-DEC-2017','D','Unclog toilet','11-DEC-2017','fmicken','15-DEC-2017','tsimons');
  INSERT INTO work_order VALUES
 ('70004','12-DEC-2017','','I','Clean common space','12-DEC-2017','fmicken','','');
  INSERT INTO work_order VALUES
 ('70005','04-DEC-2017','08-DEC-2017','I','Fix Door hinge','04-DEC-2017','fmicken','08-DEC-2017','tsimons');
  INSERT INTO work_order VALUES
 ('70006','18-DEC-2017','20-DEC-2017','N','Loft bed','18-DEC-2017','fmicken','20-DEC-2017','tsimons');
  INSERT INTO work_order VALUES
 ('70008','10-DEC-2017','','D','Fix fire alarm','02-DEC-2017','fmicken','','');

 -- Create the building table 
CREATE TABLE building (
    build_id            VARCHAR(10)	NOT NULL     UNIQUE,
	build_name	        VARCHAR(10),
	build_room          VARCHAR(10) NOT NULL,
PRIMARY KEY(build_id)
);

--create building records
 INSERT INTO building VALUES
 ('20000','Cedar','205');
  INSERT INTO building VALUES
 ('20001','Birch','205');
  INSERT INTO building VALUES
 ('20002','Somers','352');
  INSERT INTO building VALUES
 ('20003','Kerst','235');
  INSERT INTO building VALUES
 ('20004','Scanlon','233');
  INSERT INTO building VALUES
 ('20005','Pine','104');
  INSERT INTO building VALUES
 ('20006','Maple','205');
  INSERT INTO building VALUES
 ('20007','Willow','201');

 -- Create the work list table 
CREATE TABLE work_list (
    work_list_num   VARCHAR(10)	NOT NULL     UNIQUE,
	wo_num          VARCHAR(10) NOT NULL,
	emp_id	        VARCHAR(10) NOT NULL,
PRIMARY KEY(work_list_num)
);

--create work_list records
INSERT INTO work_list VALUES
('40000','70000','20000');
INSERT INTO work_list VALUES
('40001','70001','20001');
INSERT INTO work_list VALUES
('40002','70002','20002');
INSERT INTO work_list VALUES
('40003','70003','20003');
INSERT INTO work_list VALUES
('40004','70004','20004');
INSERT INTO work_list VALUES
('40005','70005','20005');
INSERT INTO work_list VALUES
('40006','70006','20006');
INSERT INTO work_list VALUES
('40007','70007','20007');

-- Create the employee table 
CREATE TABLE employee (
    emp_id          VARCHAR(10)	NOT NULL	UNIQUE,
	wo_num	        VARCHAR(10) NOT NULL,
	emp_lname	    VARCHAR(20),
	emp_fname	    VARCHAR(20),
	emp_phone	    CHAR(12),
	emp_type	    CHAR(2)      NOT NULL,
PRIMARY KEY(emp_id)
);

--create employee records
INSERT INTO employee VALUES
('20000','70000','Conelly','Marcy','2187985589','H');
INSERT INTO employee VALUES
('20001','70001','Rivers','John','2187985589','H');
INSERT INTO employee VALUES
('20002','70002','Westly','Brian','2187985589','ME');
INSERT INTO employee VALUES
('20003','70003','Buchan','Miriam','2187985589','H');
INSERT INTO employee VALUES
('20004','70004','Smith','Chloe','2187985589','J');
INSERT INTO employee VALUES
('20005','70005','Turner','Jake','2187985589','C');
INSERT INTO employee VALUES
('20006','70006','Frederick','Joe','2187985589','P');
INSERT INTO employee VALUES
('20007','70007','Zimmerman','Aaron','2187985589','J');

-- Create the list table 
CREATE TABLE lov (
    list_id         VARCHAR(10)	NOT NULL	UNIQUE,
	list_name	    VARCHAR(25) NOT NULL,
	list_value	    CHAR(2)     NOT NULL,
	list_display	CHAR(2)     NOT NULL,
PRIMARY KEY(list_id)
);

--create list records
INSERT INTO lov VALUES
('10000','Student','S','S');
INSERT INTO lov VALUES
('10001','Employee','E','E');
INSERT INTO lov VALUES
('10002','Other','O','O');
INSERT INTO lov VALUES
('10003','Janitor','J','J');
INSERT INTO lov VALUES
('10004','Carpenter','C','C');
INSERT INTO lov VALUES
('10005','Housekeeper','H','H');
INSERT INTO lov VALUES
('10006','Painter','P','P');
INSERT INTO lov VALUES
('10007','Maintenance Engineer','ME','ME');
INSERT INTO lov VALUES
('10008', 'In Progress', 'I', 'I');
INSERT INTO lov VALUES
('10009', 'Not Assigned', 'N', 'N');
INSERT INTO lov VALUES
('10010', 'Done', 'D', 'D');

--	SELECT statements Created by: Jennifer Vang
--	Created on: 12/12/2017

--SELECT * FROM employee;
--SELECT * FROM requester;
--SELECT * FROM work_list;
--SELECT * FROM work_order;
--SELECT * FROM schedule;
--SELECT * FROM building;
--SELECT * FROM lov;

SELECT b.build_id as "Building ID", 
		s.building_id as "Schedule Building ID", 
		b.build_name, b.build_room, s.requested_date, 
		s.schedule_num, s.req_id
    FROM building b 
    INNER JOIN schedule s 
    ON b.build_id = s.building_id;



SELECT w.wo_num AS "Work Order NUM", 
		s.wo_num AS "Schedule W.O. NUM", 
		s.requested_date, w.wo_start_date, 
		w.wo_end_date 
    FROM work_order w, schedule s
    WHERE w.wo_num = s.wo_num
	AND s.requested_date >= '09-DEC-2017';


SELECT e.emp_fname, e.emp_lname, e.emp_id, 
		o.wo_start_date, o.wo_description, w.work_list_num
	FROM employee e
	INNER JOIN work_list w ON e.emp_id = w.emp_id
	INNER JOIN work_order o ON w.wo_num = o.wo_num
	WHERE e.emp_id IN 
		(SELECT emp_id FROM employee
			WHERE e.emp_fname LIKE '%J%');


SELECT w.wo_num, w.wo_description, w.wo_status, 
		w.wo_start_date AS 'Start Date', 
	    DATEDIFF(dd, s.requested_date, GETDATE()) AS "Days Since Requested"
    FROM work_order w, schedule s
	WHERE w.wo_num = s.wo_num
	AND w.wo_status != 'D';


SELECT e.emp_id, e.emp_type, e.emp_fname, e.emp_lname
    FROM employee e
    WHERE LOWER(e.emp_fname) LIKE '%A%'
	ORDER BY e.emp_type;