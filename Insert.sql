USE MedicalServiceDB

INSERT INTO PatientCard(PatientFirstName, PatientLastName, PatientAdress, PatientPhoneNumber)
   VALUES ('Emily','Richardson','620-6583 Phasellus Rd.','(961) 599-2997'),
          ('Clementine','Brock','Ap #184-3909 Scelerisque Av.','(662) 767-0630'),
          ('Daria','Greer','Ap #796-9479 Ac Avenue','(563) 890-9004'),
          ('Savannah','Cox','4891 Sit Rd.','(497) 890-9540'),
		  ('Lana','Montoya','Ap #153-3060 Eget Av.','(983) 149-5776'),
		  ('Kaseem','Maxwell','6658 Id St.','(974) 628-8624'),
		  ('Rafael','Golden','9756 Varius Ave','(864) 412-1188'),
		  ('Honorato','Guthrie','558-4052 Amet, Rd.','(844) 246-8197'),
		  ('Clark','Todd','129-5509 Aliquet. Av.','(880) 289-7168'),
		  ('Alan','Calderon','Ap #112-2563 Risus. Street','(619) 742-2257');

INSERT INTO Department (DepartmentDescription)
  VALUES ('���������������� ���������'),('������������� ���������'),('���������������� ���������'),
         ('��������������� ���������'),('������������� ���������'),('������������������ ���������');

INSERT INTO Specialty (SpecialityDescription, DepartmentID)
  VALUES ('������', 1),('���������', 0),('���������', 2),('��������', 3),
         ('������', 4), ('�������', 3), ('���', 3), ('�����������', 5), ('����������', 5);     

INSERT INTO Position (PositionDescription)
  VALUES ('������'),('����'),('������� ����'),('���������� ����������');
  
INSERT INTO Employer(SpecialityID, PositionID, EmployerFirstName, EmployerLastName, EmployerPhoneNumber)
  VALUES  (6,0,'Kibo','Scott','1-826-450-7973'),
          (8,1,'Doris','Hendrix','1-490-766-6746'),
		  (7,0,'Leroy','Leach','1-952-500-9742'),
		  (0,3,'Fletcher','Hancock','1-321-445-6940'),
		  (6,3,'Stuart','Phelps','1-813-941-4692'),
		  (2,3,'Declan','Buckner','1-614-990-3830'),
		  (1,0,'Isabelle','Gamble','1-589-566-2299'),
		  (1,3,'Morgan','Olson','1-763-862-4260'),
		  (6,1,'Jolene','Johns','1-293-773-7555'),
		  (1,3,'Galvin','Larsen','1-657-942-0755');

INSERT INTO Incapacity (IncapacityDescription)
  VALUES  ('������'), ('���������');

INSERT INTO Diagnosis(IncapacityID, DiagnosisDescription)
  VALUES  (0,'������� �'),
          (0,'������'),
		  (0,'����'),
		  (0,'���������'),
		  (0,'����������'),
		  (0,'��������'); 

INSERT INTO MedProcedures(MedProcedureDescription, MedProcedurePrice, DepartmentID)
  VALUES ('������ ������', 5000, 0), 
         ('��������������� �����', 3000, 0),
		 ('���������� ������', 2000, 1),
		 ('�������', 100, 1),
		 ('����� �� ��������', 1000, 5);

INSERT INTO MedProcedures_Employers(MedProcedureID, EmployerID)
  VALUES (0,6), (0,7), (0,9), (1,6), (1,9), (2,3);

INSERT INTO Medicines(MedicinesDescription, MedicinesPrice)
  VALUES ('��������� �� �����������', 1000), 
         ('��������� �� ����', 5000),
		 ('��������� �� ��������', 3000),
		 ('��������� �� ���������', 3000),
		 ('��������� �� ������', 500);

INSERT INTO FreeMedicines(MedicinesID, FreeMedicinesNumber)
  VALUES (3, 10), (4, 10);

INSERT INTO PaidMedicines(MedicinesID, PaidMedicinesNumber)
  VALUES (3, 10), (4, 10), (2, 10);

INSERT INTO Appointment(PatientID, EmployerID, DiagnosisID)
 VALUES (0,2,2),(8,9,3),(2,4,0),(5,1,3),(7,1,2),(2,8,0),(1,9,0);

INSERT INTO Aegrotat(AppointmentID)
 VALUES (0),(1),(2);

INSERT INTO AppointmentTime(AppointmentTimeStart, AppointmentTimeEnd)
 VALUES ('09:00', '09:30'),
        ('10:00', '10:30'),
        ('10:30', '11:30'),
        ('12:00', '12:30');

INSERT INTO Shedule(EmployerID, AppointmentTimeID, Accept)
  VALUES (0, 0, 1), (1, 0, 1), (2, 0, 1), (3, 0, 1),
         (0, 1, 1), (1, 1, 0), (2, 1, 0), (3, 1, 1),
		 (0, 2, 1), (1, 2, 1), (2, 2, 1), (3, 2, 1),
		 (0, 3, 1), (1, 3, 1), (2, 3, 1), (3, 3, 0);


INSERT INTO Coupon(PatientID, EmployerID, AppointmentTimeID)
  VALUES (0, 0, 1), (1, 3, 3), (5, 6, 3), (5, 0, 3);

INSERT INTO Sanatorium(SanatoriumDescription)
 VALUES   ('��������� 1'),
          ('��������� 2'),
		  ('��������� 3');

INSERT INTO SendToSanatorium(PatientID, SanatoriumID, DepartureDate, ArrivalDate)
 VALUES   (7,2,'11.05.2017','20.05.2017'),
          (8,1,'11.05.2017','20.05.2017'),
		  (9,1,'11.05.2017','20.05.2017');

