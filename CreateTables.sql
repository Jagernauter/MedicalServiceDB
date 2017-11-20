USE MedicalServiceDB;

CREATE TABLE PatientCard(
  PatientID          int IDENTITY(0,1),
  PatientFirstName   nvarchar(20)       NOT NULL,
  PatientLastName    nvarchar(20)       NOT NULL,
  PatientAdress      nvarchar(250)      NOT NULL,
  PatientPhoneNumber nvarchar(15)       NOT NULL,

  CONSTRAINT PK_PatientID PRIMARY KEY CLUSTERED (PatientID),
  CONSTRAINT DF_PatientPhoneNumber_Unique UNIQUE (PatientPhoneNumber)
);

CREATE TABLE Department(
  DepartmentID int IDENTITY(0,1),
  DepartmentDescription nvarchar(50) NOT NULL,

  CONSTRAINT PK_DepartmentID PRIMARY KEY CLUSTERED (DepartmentID)
);

CREATE TABLE Specialty(
  SpecialityID int IDENTITY(0,1),
  SpecialityDescription nvarchar(30) NOT NULL,
  DepartmentID int NOT NULL,

  CONSTRAINT PK_SpecialityID PRIMARY KEY CLUSTERED (SpecialityID),

  CONSTRAINT FK_Specialty_DepartmentID FOREIGN KEY (DepartmentID)
                                    REFERENCES Department (DepartmentID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE Position(
  PositionID int IDENTITY(0,1),
  PositionDescription nvarchar(30) NOT NULL,

  CONSTRAINT PK_PositionID PRIMARY KEY CLUSTERED (PositionID)
);

CREATE TABLE Employer(
  EmployerID           int IDENTITY(0,1),
  SpecialityID         int                NOT NULL,
  PositionID           int                NOT NULL,
  EmployerFirstName   nvarchar(25)       NOT NULL,
  EmployerLastName    nvarchar(25)       NOT NULL,
  EmployerPhoneNumber nvarchar(15)       NOT NULL,

  CONSTRAINT PK_EmployerID PRIMARY KEY CLUSTERED (EmployerID),
  CONSTRAINT DF_EmployerPhoneNumber_Unique UNIQUE (EmployerPhoneNumber),


  CONSTRAINT FK_Employer_SpecialityID FOREIGN KEY (SpecialityID)
                                    REFERENCES Specialty (SpecialityID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_Employer_PositionID   FOREIGN KEY (PositionID)
                                    REFERENCES Position (PositionID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE Incapacity(
  IncapacityID           int IDENTITY(0,1),
  IncapacityDescription  nvarchar(15)       NOT NULL,

  CONSTRAINT PK_IncapacityID PRIMARY KEY CLUSTERED (IncapacityID)
);

CREATE TABLE Diagnosis(
  DiagnosisID           int IDENTITY(0,1),
  IncapacityID          int                NOT NULL,
  DiagnosisDescription  ntext              NOT NULL,

  CONSTRAINT PK_DiagnosisID PRIMARY KEY CLUSTERED (DiagnosisID),

  CONSTRAINT FK_Diagnosis_IncapacityID FOREIGN KEY (IncapacityID)
                                    REFERENCES Incapacity (IncapacityID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE MedProcedures(
  MedProcedureID          int IDENTITY(0,1),
  MedProcedureDescription nvarchar(25)     NOT NULL,
  MedProcedurePrice       int              NOT NULL,
  DepartmentID            int              NOT NULL,

  CONSTRAINT PK_MedProcedures_MedProcedureID PRIMARY KEY CLUSTERED (MedProcedureID),

  CONSTRAINT FK_MedProcedures_DepartmentID FOREIGN KEY (DepartmentID)
                                    REFERENCES Department (DepartmentID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE MedProcedures_Employers(
  MedProcedureID  int NOT NULL,
  EmployerID      int NOT NULL,

  CONSTRAINT FK_MedProceduresEmployers_EmployerID FOREIGN KEY (EmployerID)
                                              REFERENCES Employer (EmployerID),

  CONSTRAINT FK_MedProceduresEmployers_MedProcedureID  FOREIGN KEY (MedProcedureID)
                                                     REFERENCES MedProcedures (MedProcedureID)
													 ON UPDATE CASCADE
													 ON DELETE CASCADE
);

CREATE TABLE Medicines(
  MedicinesID           int IDENTITY(0,1),
  MedicinesDescription  nvarchar(25),
  MedicinesPrice        int NOT NULL

  CONSTRAINT PK_MedicinesID PRIMARY KEY CLUSTERED (MedicinesID)
);

CREATE TABLE FreeMedicines(
  MedicinesID          int NOT NULL,
  FreeMedicinesNumber  int NOT NULL

  CONSTRAINT FK_FreeMedicines_MedicinesID  FOREIGN KEY (MedicinesID)
                                    REFERENCES Medicines (MedicinesID )
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE PaidMedicines(
  MedicinesID         int NOT NULL,
  PaidMedicinesNumber int NOT NULL

  CONSTRAINT FK_PaidMedicines_MedicinesID  FOREIGN KEY (MedicinesID)
                                    REFERENCES Medicines (MedicinesID )
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE Diagnosis_Medicines(
  DiagnosisID  int  NOT NULL,
  MedicinesID  int  NOT NULL,

  CONSTRAINT FK_DiagnosisMedicines_DiagnosisID FOREIGN KEY (DiagnosisID)
                                    REFERENCES Diagnosis (DiagnosisID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_DiagnosisMedicines_MedicinesID  FOREIGN KEY (MedicinesID)
                                    REFERENCES Medicines (MedicinesID )
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE Appointment(
  AppointmentID   int  IDENTITY(0,1),
  PatientID       int  NOT NULL,
  EmployerID      int  NOT NULL,
  DiagnosisID     int  NOT NULL,
  TreatmentDate   datetime DEFAULT (getdate()),

  CONSTRAINT PK_AppointmentID PRIMARY KEY CLUSTERED (AppointmentID),

  CONSTRAINT FK_Appointment_PatientID    FOREIGN KEY (PatientID)
                                    REFERENCES PatientCard (PatientID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_Appointment_EmployerID   FOREIGN KEY (EmployerID)
                                    REFERENCES Employer (EmployerID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_Appointment_DiagnosisID  FOREIGN KEY (DiagnosisID)
                                    REFERENCES Diagnosis (DiagnosisID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE
);

CREATE TABLE Aegrotat(
  AegrotatID      int IDENTITY(0,1),
  AppointmentID   int NOT NULL,
  GetAegrotatDate datetime DEFAULT (getdate()),

  CONSTRAINT PK_AegrotatID PRIMARY KEY CLUSTERED (AegrotatID),

  CONSTRAINT FK_Aegrotat_AppointmentID  FOREIGN KEY (AppointmentID)
                                      REFERENCES Appointment (AppointmentID)
			                          ON UPDATE CASCADE
			                          ON DELETE CASCADE
);

CREATE TABLE AppointmentTime(
  AppointmentTimeID     int  IDENTITY(0,1),
  AppointmentTimeStart  time               NOT NULL,
  AppointmentTimeEnd    time               NOT NULL,

  CONSTRAINT PK_AppointmentTimeID PRIMARY KEY CLUSTERED (AppointmentTimeID)
);

CREATE TABLE Shedule(
  EmployerID        int  NOT NULL,
  AppointmentTimeID int  NOT NULL,
  Accept            bit  NOT NULL,

  CONSTRAINT FK_Shedule_AppointmentTimeID FOREIGN KEY (AppointmentTimeID)
                                         REFERENCES AppointmentTime (AppointmentTimeID)
			                             ON UPDATE CASCADE
			                             ON DELETE CASCADE
);

CREATE TABLE Coupon(
  CouponID           int IDENTITY(0,1),
  PatientID          int                NOT NULL,
  EmployerID         int                NOT NULL,
  AppointmentTimeID  int                NOT NULL,
  CouponDate         datetime           DEFAULT (getdate()),

  CONSTRAINT PK_AppointmentCouponID PRIMARY KEY CLUSTERED (CouponID),

  CONSTRAINT FK_Coupon_PatientID    FOREIGN KEY (PatientID)
                                    REFERENCES PatientCard (PatientID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_Coupon_EmployerID   FOREIGN KEY (EmployerID)
                                    REFERENCES Employer (EmployerID)
			                        ON UPDATE CASCADE
			                        ON DELETE CASCADE,

  CONSTRAINT FK_Coupon_AppointmentTimeID FOREIGN KEY (AppointmentTimeID)
                                         REFERENCES AppointmentTime (AppointmentTimeID)
			                             ON UPDATE CASCADE
			                             ON DELETE CASCADE
);

CREATE TABLE Sanatorium(
  SanatoriumID          int  IDENTITY(0,1),
  SanatoriumDescription text                NOT NULL,

  CONSTRAINT PK_SanatoriumID PRIMARY KEY CLUSTERED (SanatoriumID)
);

CREATE TABLE SendToSanatorium(
  SanatoriumDecreeID int  IDENTITY(0,1),
  PatientID          int                 NOT NULL,
  SanatoriumID       int                 NOT NULL,
  DepartureDate      datetime            NOT NULL,
  ArrivalDate        datetime            NOT NULL,

  CONSTRAINT PK_SanatoriumDecreeID PRIMARY KEY CLUSTERED (SanatoriumDecreeID),

  CONSTRAINT FK_SendToSanatorium_SanatoriumID    FOREIGN KEY (SanatoriumID)
                                                 REFERENCES Sanatorium (SanatoriumID)
			                                     ON UPDATE CASCADE
			                                     ON DELETE CASCADE,

  CONSTRAINT FK_SendToSanatorium_PatientID    FOREIGN KEY (PatientID)
                                        REFERENCES PatientCard (PatientID)
			                            ON UPDATE CASCADE
			                            ON DELETE CASCADE
);






