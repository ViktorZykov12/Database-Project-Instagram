USE instagram; 

SELECT * FROM users LIMIT 10;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM followers LIMIT 10;
UPDATE followers SET updated_at = NOW() WHERE updated_at < created_at;
UPDATE followers SET confirmed_at = NOW() WHERE confirmed_at < requested_at;

SELECT * FROM followers_statuses;
UPDATE followers_statuses SET created_at = NOW();

SELECT * FROM likes LIMIT 10;

SELECT * FROM media_types;
UPDATE media_types SET created_at = NOW();

SELECT * FROM messages LIMIT 10;

SELECT * FROM posts LIMIT 10;
UPDATE posts SET updated_at = NOW() WHERE updated_at < created_at;
UPDATE posts SET filename = CONCAT(
  filename,  '.',
  (SELECT nickname FROM users ORDER BY RAND() LIMIT 1)
);

SELECT * FROM posts_comments LIMIT 10;
UPDATE posts_comments SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM posts_marks LIMIT 10;

SELECT * FROM profiles LIMIT 10;
UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at;
SELECT * FROM profiles where created_at < birthday;
UPDATE profiles SET birthday = birthday - '00100000' where created_at < birthday;





