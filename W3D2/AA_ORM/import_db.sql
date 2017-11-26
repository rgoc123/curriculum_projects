DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;

CREATE TABLE users (
  
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO 
  users (fname, lname)
VALUES 
  ("Francine", "Whiteboard"),
  ("Sunny", "Wong"),
  ("Brian Crawford", "Scott");
  

CREATE TABLE questions (
  
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL, 
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  
  FOREIGN KEY(author_id) REFERENCES users(id)
); 

INSERT INTO 
  questions (title, body, author_id)
VALUES 
  ("Where did the soda go?", "No seriously, like, where did it go?????", (SELECT users.id FROM users WHERE users.fname = 'Francine')),
  ("Does anyone know where the soda is?", "I feel like Brian knows where the soda is...", (SELECT users.id FROM users WHERE users.fname = 'Francine')),
  ("Why is everyone blaming me?", "I don't know where the soda is. Why are you bothering me???", 3);

CREATE TABLE question_follows (
  
  id INTEGER PRIMARY KEY, 
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  question_follows (user_id, question_id)
VALUES 
  ((SELECT users.id FROM users WHERE users.fname = 'Francine'),
  (SELECT questions.id FROM questions WHERE questions.id = 1)),
  ((SELECT users.id FROM users WHERE users.fname = 'Sunny'),
  (SELECT questions.id FROM questions WHERE questions.id = 2)),
  ((SELECT users.id FROM users WHERE users.fname = 'Sunny'),
  (SELECT questions.id FROM questions WHERE questions.id = 3)),
  ((SELECT users.id FROM users WHERE users.fname = 'Francine'),
  (SELECT questions.id FROM questions WHERE questions.id = 3));
  

CREATE TABLE replies (
  
  id INTEGER PRIMARY KEY, 
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,1), (1,2), (1,3), (3,1), (3,2), (3,3), (2,2);
























