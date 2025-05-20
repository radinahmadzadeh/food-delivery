CREATE DATABASE delivery_food;

USE delivery_food;

CREATE TABLE users (
                       Id INT PRIMARY KEY AUTO_INCREMENT,
                       First_Name NVARCHAR(100),
                       Last_Name NVARCHAR(100),
                       National_Code NVARCHAR(200),
                       Role ENUM('Student','Teacher'),
                       Student_Number NVARCHAR(100),
                       Teacher_Number NVARCHAR(100),
                       Department NVARCHAR(100),
                       Scientific_Rank NVARCHAR(100)
);

CREATE TABLE days (
                      Day_Id INT PRIMARY KEY AUTO_INCREMENT,
                      Day_Name ENUM('Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday')
);

CREATE TABLE menu (
                      Food_Id INT PRIMARY KEY AUTO_INCREMENT,
                      Food_Name NVARCHAR(100),
                      Price INT,
                      Day DATE,
                      Day_Id INT,
                      FOREIGN KEY (Day_Id) REFERENCES days(Day_Id)
);

CREATE TABLE students (
                          Id INT PRIMARY KEY,
                          Student_Id NVARCHAR(100),
                          Major NVARCHAR(100),
                          FOREIGN KEY (Id) REFERENCES users(Id)
);

CREATE TABLE teacher (
                         Id INT PRIMARY KEY,
                         Teacher_Id NVARCHAR(100),
                         Department NVARCHAR(100),
                         Scientific_Rank NVARCHAR(100),
                         FOREIGN KEY (Id) REFERENCES users(Id)
);

CREATE TABLE orders (
                        Order_Id INT PRIMARY KEY AUTO_INCREMENT,
                        Person_Id INT,
                        Food_Id INT,
                        Order_Date DATE,
                        FOREIGN KEY (Person_Id) REFERENCES users(Id),
                        FOREIGN KEY (Food_Id) REFERENCES menu(Food_Id)
);

INSERT INTO users (First_Name, Last_Name, National_Code, Role, Student_Number, Teacher_Number, Department, Scientific_Rank)
VALUES
    ('radin','ahmadzadeh','0151082006','Student','40313401',null,'computer science','bachelor'),
    ('sadra','iranmanesh','123456789','Teacher',null,'987654321','computer science','professor');

INSERT INTO days(day_name)
VALUES ('Saturday'), ('Sunday'), ('Monday'), ('Tuesday'), ('Wednesday'), ('Thursday'), ('Friday');

INSERT INTO menu(Food_Id, Food_Name, Price, Day, Day_Id)
VALUES
    (1,'pizza',165000,'2024-08-21',2),
    (2,'pasta',140000,'2024-08-20',1);

INSERT INTO students(id, student_id, major)
VALUES
    (1,'40313401','computer science'),
    (2,'40313402','math');

INSERT INTO teacher(Id, teacher_id, department, Scientific_Rank)
VALUES
    (1,'123456789','computer science','professor'),
    (2,'987654321','computer engineering','professor');

INSERT INTO orders(order_id, person_id, food_id, order_date)
VALUES (101, 1, 1, '2024-08-21'),
       (102, 2, 2, '2024-08-20');
