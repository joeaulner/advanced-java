CREATE TABLE APP.users
(
    email VARCHAR(30) PRIMARY KEY NOT NULL,
    password VARCHAR(30) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(7),
    age INT
);