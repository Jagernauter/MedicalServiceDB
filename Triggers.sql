USE MedicalServiceDB
SELECT Employer.EmployerID, Employer.SpecialityID, Employer.EmployerFirstName, 
       Employer.EmployerLastName, Specialty.SpecialityDescription
  FROM Employer INNER JOIN Specialty
    ON Employer.SpecialityID = Specialty.SpecialityID
  WHERE Employer.SpecialityID IN(SELECT SpecialityID 
                          FROM Specialty
						  WHERE DepartmentID = 3)

SELECT DepartmentID, DepartmentDescription
  FROM Department;

SELECT SpecialityID, SpecialityDescription, DepartmentID
  FROM Specialty;