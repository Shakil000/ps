
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);

INSERT INTO "user"(username)
VALUES
('Rabbi'),('Basash'),('Sagor'),('Nodis');

INSERT INTO post(title, user_id)
VALUES
('Enjoy a sunny dat with Rabbi ☀️',2),
('Batash just share a amazing recipe! 🍑',1),
('Exploring adventure with Sagor 😒',4),
('Nodis wisdom always leaves me inspired.⛵',4) 

select * from "user";
SELECT * FROM post;

SELECT post.id,title, username FROM post
JOIN "user" on post.user_id = "user".id;


INSERT INTO post(id,title, user_id)
VALUES
(5,'New test title for join checking null ☀️', NULL)

SELECT title,username FROM post
LEFT JOIN "user" on post.user_id = "user".id;

SELECT title,username FROM post
RIGHT JOIN "user" on post.user_id = "user".id;

SELECT * FROM post
FULL JOIN "user" on post.user_id = "user".id;