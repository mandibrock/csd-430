/*
    Name: Amanda Brock
    Assignment: Modules 5 & 6
    Purpose: Populates the movie data table with ten records.
*/

USE CSD430;

INSERT INTO amandamoviesdata
    (title, genre, release_year, rating, runtime)
VALUES
    ('Spirited Away', 'Fantasy', 2001, 'PG', 125),
    ('Howl''s Moving Castle', 'Fantasy', 2004, 'PG', 119),
    ('My Neighbor Totoro', 'Fantasy', 1988, 'G', 86),
    ('Princess Mononoke', 'Fantasy', 1997, 'PG-13', 134),
    ('Kiki''s Delivery Service', 'Fantasy', 1989, 'G', 103),
    ('Ponyo', 'Fantasy', 2008, 'G', 101),
    ('The Cat Returns', 'Fantasy', 2002, 'G', 75),
    ('Nausicaa of the Valley of the Wind', 'Science Fiction', 1984, 'PG', 117),
    ('Castle in the Sky', 'Adventure', 1986, 'PG', 124),
    ('The Boy and the Heron', 'Fantasy', 2023, 'PG-13', 124);