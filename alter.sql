-- Active: 1747551989052@@127.0.0.1@5432@skl
-- create Table users(
--     Name VARCHAR(30),
--     Email VARCHAR(30),
--     Password VARCHAR(30)
-- );

INSERT INTO users(Name, Email, Password)
VALUES('Shakil','skl@gmail.com',1234);

SELECT * from users2;

ALTER Table users
    ADD COLUMN id INT;
ALTER Table users
    DROP COLUMN id;

ALTER TABLE users
    RENAME COLUMN id to user_id;    

CREATE TABLE users2 (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
email VARCHAR(255) UNIQUE
);

INSERT INTO users2 values(2,'Robot1','rb1@gmail.com');  


CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(20),
    country VARCHAR(30)
);

SELECT DISTINCT blood_group FROM student ORDER BY blood_group DESC;
SELECT DISTINCT age FROM student ORDER BY age ASC;
SELECT DISTINCT age FROM student ORDER BY age DESC;
INSERT INTO student(first_name,last_name,age,grade,course,email,dob,blood_group,country)
    VALUES
    ('Abdul1','Kader',30,'A+','Flatter','kader@gmail.com','01-09-1992','A-','SA'),
    ('Firoz2','Mahmaud',20,'A+','PHP','Firoz@gmail.com','01-07-1999','B+','Uganda'),
    ('Jahangir3','Alam',35,'A+','Network','jh@gmail.com','01-07-1985','AB+','JAPAN'),
    ('Robin4','Alam',25,'A','Unknown','robin@gmail.com','01-07-2000','AB-','UK'),
    ('Salman7','Hasan',20,'A+','TS','sal@gmail.com','01-07-2005','A+','USA')

-- filter data
SELECT * FROM student
where country =  'UK';

SELECT * FROM student
where grade = 'A+' AND course = 'JS';
SELECT * FROM student
where (country = 'USA' OR country = 'SA') AND age = 20;

SELECT * FROM student
where (country = 'USA' OR country = 'SA') AND age = 20;