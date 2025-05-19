

CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INT REFERENCES "user"(id) ON DELETE CASCADE
);

INSERT INTO "user"(username)
VALUES
('Akash'),('Batash'),('Nodi'),('Nala'),('Khal'),('Bill'),('Pahar'),('Porbot');

DELETE from "user"
where id = 5

DROP TABLE "user";
DROP TABLE post;

INSERT INTO post(title, user_id)
    VALUES('Allah Mohan, I love Allah',2),
    ('Many days ago',3),
    ('There was a programmer',6),
    ('He know js',5),
    ('He also know ts',4),
    ('Now he is learning sql',8),
    ('He want to be a great developer',1),
    ('He is a successful developer',7)

SELECT * FROM "user";
SELECT * FROM post;