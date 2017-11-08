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
  VALUES ('������, 1'),('���������, 0'),('���������, 2'),('��������, 3'),
         ('������, 4'), ('�������, 3'), ('���, 3'), ('�����������, 3'), ('����������, 3');     

INSERT INTO Specialty (SpecialityDescription, DepartmentID)
  VALUES ('������, 1'),('���������, 0'),('���������, 2'),('��������, 3'),
         ('������, 4'), ('�������, 3'), ('���, 3'), ('�����������, 3'), ('����������, 3');      