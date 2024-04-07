-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-04-06 20:38:16 CDT
--   site:      SQL Server 2012
--   type:      SQL Server 2012



CREATE TABLE appointment 
    (
     appointment_id INTEGER NOT NULL , 
     patient_id INTEGER NOT NULL , 
     dentist_id INTEGER NOT NULL , 
     appointment_date DATE , 
     appointment_status VARCHAR (20) , 
     people_people_id INTEGER NOT NULL , 
     office_id INTEGER NOT NULL , 
     clinic_office_office_id INTEGER NOT NULL 
    )
GO

ALTER TABLE appointment ADD CONSTRAINT appointment_PK PRIMARY KEY CLUSTERED (appointment_id, clinic_office_office_id, people_people_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE clinic_office 
    (
     office_id INTEGER NOT NULL , 
     office_address VARCHAR (200) NOT NULL , 
     contact_number VARCHAR (20) NOT NULL 
    )
GO

ALTER TABLE clinic_office ADD CONSTRAINT clinic_office_PK PRIMARY KEY CLUSTERED (office_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE clinic_office ADD CONSTRAINT clinic_office_office_id_UN UNIQUE NONCLUSTERED (office_id)
GO

CREATE TABLE dentist 
    (
     people_id INTEGER NOT NULL , 
     specialization VARCHAR (200) NOT NULL , 
     status VARCHAR (10) NOT NULL 
    )
GO

ALTER TABLE dentist ADD CONSTRAINT dentist_PK PRIMARY KEY CLUSTERED (people_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE employee 
    (
     people_id INTEGER NOT NULL , 
     clinic_id INTEGER NOT NULL , 
     employee_date DATE NOT NULL , 
     salary BIGINT , 
     clinic_office_office_id INTEGER NOT NULL 
    )
GO

ALTER TABLE employee ADD CONSTRAINT employee_PK PRIMARY KEY CLUSTERED (people_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE employee ADD CONSTRAINT employee_PKv1 UNIQUE NONCLUSTERED (clinic_office_office_id)
GO

CREATE TABLE patient 
    (
     people_id INTEGER NOT NULL , 
     birthday DATE NOT NULL , 
     mail_address VARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE patient ADD CONSTRAINT patient_PK PRIMARY KEY CLUSTERED (people_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE people 
    (
     people_id INTEGER NOT NULL , 
     firstName VARCHAR (25) NOT NULL , 
     lastName VARCHAR (25) NOT NULL , 
     email VARCHAR (50) NOT NULL , 
     home_address VARCHAR (100) NOT NULL , 
     register_date DATE NOT NULL 
    )
GO

ALTER TABLE people ADD CONSTRAINT people_PK PRIMARY KEY CLUSTERED (people_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE users 
    (
     user_id INTEGER NOT NULL , 
     uername VARCHAR (20) NOT NULL , 
     password VARCHAR (20) NOT NULL , 
     register_date DATE NOT NULL , 
     status VARCHAR (10) NOT NULL , 
     people_people_id INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    users__IDX ON users 
    ( 
     people_people_id 
    ) 
GO

ALTER TABLE users ADD CONSTRAINT users_PK PRIMARY KEY CLUSTERED (user_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE appointment 
    ADD CONSTRAINT appointment_clinic_office_FK FOREIGN KEY 
    ( 
     clinic_office_office_id
    ) 
    REFERENCES clinic_office 
    ( 
     office_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE appointment 
    ADD CONSTRAINT appointment_people_FK FOREIGN KEY 
    ( 
     people_people_id
    ) 
    REFERENCES people 
    ( 
     people_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dentist 
    ADD CONSTRAINT dentist_people_FK FOREIGN KEY 
    ( 
     people_id
    ) 
    REFERENCES people 
    ( 
     people_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE employee 
    ADD CONSTRAINT employee_clinic_office_FK FOREIGN KEY 
    ( 
     clinic_office_office_id
    ) 
    REFERENCES clinic_office 
    ( 
     office_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE employee 
    ADD CONSTRAINT employee_people_FK FOREIGN KEY 
    ( 
     people_id
    ) 
    REFERENCES people 
    ( 
     people_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE patient 
    ADD CONSTRAINT patient_people_FK FOREIGN KEY 
    ( 
     people_id
    ) 
    REFERENCES people 
    ( 
     people_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE users 
    ADD CONSTRAINT users_people_FK FOREIGN KEY 
    ( 
     people_people_id
    ) 
    REFERENCES people 
    ( 
     people_id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
