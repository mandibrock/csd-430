/*
    Name: Amanda Brock
    Assignment: Modules 5 & 6
    Purpose: Creates the movie data table used for the project.
*/

CREATE DATABASE IF NOT EXISTS CSD430;

USE CSD430;

CREATE TABLE amandamoviesdata (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    runtime INT
);