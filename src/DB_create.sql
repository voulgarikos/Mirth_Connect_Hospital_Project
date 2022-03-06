
--Creating Tables
DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
  EmployeeID INTEGER PRIMARY KEY NOT NULL,
  D_Name TEXT NOT NULL,
  Position TEXT NOT NULL,
  SSN INTEGER NOT NULL
); 

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
  PID INTEGER PRIMARY KEY NOT NULL,
  P_Name TEXT NOT NULL,
  P_Address TEXT NOT NULL,
  Phone TEXT NOT NULL,
  InsuranceID INTEGER NOT NULL,
  PCP INTEGER NOT NULL
    CONSTRAINT fk_Doctor_EmployeeID REFERENCES Doctor(EmployeeID)
);

DROP TABLE IF EXISTS Nurse;
CREATE TABLE Nurse (
  EmployeeID INTEGER PRIMARY KEY NOT NULL,
  N_Name TEXT NOT NULL,
  Position TEXT NOT NULL,
  Registered BIT NOT NULL,
  );

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  DepartmentID INTEGER PRIMARY KEY NOT NULL,
  D_Name TEXT NOT NULL,
  Head INTEGER NOT NULL
    CONSTRAINT fk_Doc_EmployeeID REFERENCES Doctor(EmployeeID)
);

DROP TABLE IF EXISTS Therapy;
CREATE TABLE Therapy (
  Code INTEGER PRIMARY KEY NOT NULL,
  T_Name TEXT NOT NULL,
  Cost REAL NOT NULL
);

DROP TABLE IF EXISTS Specialisation;
CREATE TABLE Specialisation (
  Doctor INTEGER NOT NULL
    CONSTRAINT fk_Specialisation_EmployeeID REFERENCES Doctor(EmployeeID),
  Treatment INTEGER NOT NULL
    CONSTRAINT fk_Therapy_Code REFERENCES Therapy(Code),
  CertificationDate DATETIME NOT NULL,
  CertificationExpires DATETIME NOT NULL,
  PRIMARY KEY(Doctor, Treatment)
);

DROP TABLE IF EXISTS Room;
CREATE TABLE Room (
  Number INTEGER PRIMARY KEY NOT NULL,
  Kind TEXT NOT NULL,
  RoomFloor INTEGER NOT NULL,
  Unavailable BIT NOT NULL,
  
);


DROP TABLE IF EXISTS Appointment;
CREATE TABLE Appointment (
  AppointmentID INTEGER PRIMARY KEY NOT NULL,
  Patient INTEGER NOT NULL
    CONSTRAINT fk_Appointment_Patient_PID REFERENCES Patient(PID),
  PrepNurse INTEGER
    CONSTRAINT fk_Appointment_Nurse_EmployeeID REFERENCES Nurse(EmployeeID),
  Doctor INTEGER NOT NULL
    CONSTRAINT fk_Appointment_Doctor_EmployeeID REFERENCES Doctor(EmployeeID),
  Entry_time DATE NOT NULL,
  Exit_time DATE NOT NULL,
  ExaminationRoom TEXT NOT NULL
);

DROP TABLE IF EXISTS Medicaments;
CREATE TABLE Medicaments (
  Code INTEGER PRIMARY KEY NOT NULL,
  Name TEXT NOT NULL,
  Brand TEXT NOT NULL,
  Description TEXT NOT NULL
);

DROP TABLE IF EXISTS Prescribes;
CREATE TABLE Prescribes (
  Doctor INTEGER NOT NULL
    CONSTRAINT fk_Prescribes_Doctor_EmployeeID REFERENCES Doctor(EmployeeID),
  Patient INTEGER NOT NULL
    CONSTRAINT fk_Prescribes_Patient_PID REFERENCES Patient(PID),
  Medicaments INTEGER NOT NULL
    CONSTRAINT fk_Prescribes_Medicaments_Code REFERENCES Medicaments(Code),
  P_Date DATE NOT NULL,
  Appointment INTEGER
    CONSTRAINT fk_Prescribes_Appointment_AppointmentID REFERENCES Appointment(AppointmentID),
  Dose TEXT NOT NULL,
  PRIMARY KEY(Doctor, Patient, Medicaments, P_Date)
);

DROP TABLE IF EXISTS Stay;
CREATE TABLE Stay (
  StayID INTEGER PRIMARY KEY NOT NULL,
  Patient INTEGER NOT NULL
    CONSTRAINT fk_Stay_Patient_PID REFERENCES Patient(PID),
  Room INTEGER NOT NULL
    CONSTRAINT fk_Stay_Room_Number REFERENCES Room(Number),
  CheckIn DATE NOT NULL,
  CheckOut DATE NOT NULL
);

DROP TABLE IF EXISTS Patient_State;
CREATE TABLE Patient_State (
  Patient INTEGER NOT NULL
    CONSTRAINT fk_State_Patient_PID REFERENCES Patient(PID),
  Therapy INTEGER NOT NULL
    CONSTRAINT fk_State_Therapy_Code REFERENCES Therapy(Code),
  Stay INTEGER NOT NULL
    CONSTRAINT fk_State_Stay_StayID REFERENCES Stay(StayID),
  S_Date DATETIME NOT NULL,
  Doctor INTEGER NOT NULL
    CONSTRAINT fk_State_Doctor_EmployeeID REFERENCES Doctor(EmployeeID),
  AssistingNurse INTEGER
    CONSTRAINT fk_State_Nurse_EmployeeID REFERENCES Nurse(EmployeeID),
  PRIMARY KEY(Patient, Therapy, Stay, S_Date)
);


--Dataset

INSERT INTO Doctor VALUES(1,'Bill Simons','Doctor',111);
INSERT INTO Doctor VALUES(2,'John Biils','Doctor',222);
INSERT INTO Doctor VALUES(3,'Chris James','Surgery Doctor',333);
INSERT INTO Doctor VALUES(4,'Maria Statham','Head of Doctors',444);
INSERT INTO Doctor VALUES(5,'Jenny Dean','Head Chief of Medical',555);
INSERT INTO Doctor VALUES(6,'David Stern','Trainee Doctor',666);
INSERT INTO Doctor VALUES(7,'John Doe','Surgery Doctor',777);


INSERT INTO Department VALUES(1,'First Aid',4);
INSERT INTO Department VALUES(2,'Surgery',7);
INSERT INTO Department VALUES(3,'Onkology',9);
INSERT INTO Department VALUES(4,'Birth',11);



INSERT INTO Therapy VALUES(1,'Reverse Rhinopodoplasty',1500.0);
INSERT INTO Therapy VALUES(2,'Obtuse Pyloric Recombobulation',3750.0);
INSERT INTO Therapy VALUES(3,'Folded Demiophtalmectomy',4500.0);
INSERT INTO Therapy VALUES(4,'Complete Walletectomy',10000.0);
INSERT INTO Therapy VALUES(5,'Obfuscated Dermogastrotomy',4899.0);
INSERT INTO Therapy VALUES(6,'Reversible Pancreomyoplasty',5600.0);
INSERT INTO Therapy VALUES(7,'Follicular Demiectomy',25.0);

INSERT INTO Patient VALUES(100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1);
INSERT INTO Patient VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2);
INSERT INTO Patient VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2);
INSERT INTO Patient VALUES(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

INSERT INTO Nurse VALUES(101,'Theresa Burns','Chief of Nurse',1,111111110);
INSERT INTO Nurse VALUES(102,'Lia Jonnes','Nurse',1,222222220);
INSERT INTO Nurse VALUES(103,'Jim Beam','Nurse',0,333333330);

INSERT INTO Appointment VALUES(13216584,100000001,101,1,'2021-04-24','2021-04-24','A');
INSERT INTO Appointment VALUES(26548913,100000002,101,2,'2021-04-24','2021-04-24','B');
INSERT INTO Appointment VALUES(36549879,100000001,102,1,'2021-04-25','2021-04-25','A');
INSERT INTO Appointment VALUES(46846589,100000004,103,4,'2021-04-25','2021-04-25','B');
INSERT INTO Appointment VALUES(59871321,100000004,NULL,4,'2021-04-26','2021-04-26','C');
INSERT INTO Appointment VALUES(69879231,100000003,103,2,'2021-04-26','2021-04-26','C');
INSERT INTO Appointment VALUES(76983231,100000001,NULL,3,'2021-04-26','2021-04-26','C');
INSERT INTO Appointment VALUES(86213939,100000004,102,9,'2021-04-27','2021-04-21','A');
INSERT INTO Appointment VALUES(93216548,100000002,101,2,'2021-04-27','2021-04-27','B');

INSERT INTO Medicaments VALUES(1,'Cortanex 1','Biolabs','N/A');
INSERT INTO Medicaments VALUES(2,'Prioritin','Exartis','N/A');
INSERT INTO Medicaments VALUES(3,'Mirthrin','Symantec','N/A');
INSERT INTO Medicaments VALUES(4,'Beritim','Rache','N/A');


INSERT INTO Prescribes VALUES(1,10001,1,'2021-04-24',13216584,'5');
INSERT INTO Prescribes VALUES(9,10004,2,'2021-04-27',86213939,'10');
INSERT INTO Prescribes VALUES(9,10004,2,'2021-04-30',NULL,'5');



INSERT INTO Room VALUES(101,'Single',1,0);
INSERT INTO Room VALUES(102,'Single',1,0);
INSERT INTO Room VALUES(103,'Single',1,0);
INSERT INTO Room VALUES(111,'Single',1,0);
INSERT INTO Room VALUES(112,'Double',1,1);
INSERT INTO Room VALUES(113,'Single',1,0);
INSERT INTO Room VALUES(121,'Triple',1,0);
INSERT INTO Room VALUES(122,'Triple',1,0);
INSERT INTO Room VALUES(123,'Single',1,0);
INSERT INTO Room VALUES(201,'Single',2,1);
INSERT INTO Room VALUES(202,'Single',2,0);
INSERT INTO Room VALUES(203,'Single',2,0);
INSERT INTO Room VALUES(211,'Triple',2,0);
INSERT INTO Room VALUES(212,'Single',2,0);
INSERT INTO Room VALUES(213,'Single',2,1);
INSERT INTO Room VALUES(221,'Quadruple',2,0);
INSERT INTO Room VALUES(222,'Single',2,0);
INSERT INTO Room VALUES(223,'Single',2,0);
INSERT INTO Room VALUES(301,'Single',3,0);
INSERT INTO Room VALUES(302,'Double',3,1);
INSERT INTO Room VALUES(303,'Single',3,0);
INSERT INTO Room VALUES(311,'Single',3,0);
INSERT INTO Room VALUES(312,'Single',3,0);




INSERT INTO Stay VALUES(3215,100000001,111,'2021-05-01','2021-05-04');
INSERT INTO Stay VALUES(3216,100000003,123,'2021-05-03','2021-05-14');
INSERT INTO Stay VALUES(3217,100000004,112,'2021-05-02','2021-05-03');

INSERT INTO Patient_State VALUES(100000001,6,3215,'2021-05-02',3,101);
INSERT INTO Patient_State VALUES(100000001,2,3215,'2021-05-03',7,101);
INSERT INTO Patient_State VALUES(100000004,1,3217,'2021-05-07',3,102);
INSERT INTO Patient_State VALUES(100000004,5,3217,'2021-05-09',6,NULL);
INSERT INTO Patient_State VALUES(100000001,7,3217,'2021-05-10',7,101);
INSERT INTO Patient_State VALUES(100000004,4,3217,'2021-05-13',3,103);

INSERT INTO Specialisation VALUES(3,1,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(3,2,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(3,5,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(3,6,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(3,7,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(6,2,'2021-01-01','2021-12-31');
INSERT INTO Specialisation VALUES(6,5,'2021-01-01','2021-12-31');