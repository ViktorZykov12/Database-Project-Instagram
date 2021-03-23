USE instagram;

-- Вывести фамилию имя и телефон в котором проживем пользователь с ником 'hartmann'

SELECT 
	last_name,
	first_name,
	phone 
FROM profiles 
WHERE user_id = (SELECT id FROM users WHERE nickname = 'hartmann');

-- Вывести фамилию, имя, номер телефона людей мужского пола.

SELECT first_name, last_name, phone, gender FROM profiles where gender = 'MALE';

-- Вывести список людей у которых наибольшее количество постов (10 человек)

SELECT
	(SELECT nickname FROM users WHERE id = posts.user_id) AS name,
	COUNT(*) AS total_posts
	FROM posts
GROUP BY name
ORDER BY total_posts DESC
LIMIT 10;

-- Выборка фотографий пользователя

SELECT posts.id, users.nickname, posts.user_id, posts.filename
  FROM posts
    JOIN users
      ON posts.user_id = users.id
    JOIN media_types
      ON posts.media_type_id = media_types.id     
  WHERE posts.user_id = 2 AND media_types.name = 'PHOTO';

 -- Сообщения от пользователя
 
SELECT messages.body, users.nickname, messages.created_at
  FROM messages
    JOIN users
      ON users.id = messages.to_user_id
  WHERE messages.from_user_id = 5;
-
-- Сообщения к пользователю

SELECT messages.body, users.nickname, messages.created_at
  FROM messages
    JOIN users
      ON users.id = messages.from_user_id
  WHERE messages.to_user_id = 5;
  
-- Пользователи с наибольшим количеством подписчиков 
 
 SELECT users.nickname, profiles.first_name, profiles.last_name, COUNT(followers.follower_id) as count_followers
 	FROM users 
 	JOIN profiles
 	  ON users.id = profiles.user_id
 	JOIN followers 
 	  ON users.id = followers.follower_id
GROUP BY users.nickname
ORDER BY count_followers DESC 
LIMIT 10;

-- Представления

CREATE VIEW messages_user_12
AS SELECT users.id, users.nickname, messages.body, messages.created_at
FROM users, messages
WHERE users.id = 12 AND users.id = messages.to_user_id;

SELECT * FROM messages_user_12;

CREATE VIEW IGTV_user_99
AS SELECT users.id, users.nickname, posts.user_id, posts.filename
  FROM users
    JOIN posts
      ON users.id = posts.user_id
    JOIN media_types
      ON posts.media_type_id = media_types.id     
  WHERE posts.user_id = 99 AND media_types.name = 'IGTV';
 
 SELECT * FROM IGTV_user_99;

-- Триггер, при удалении пользователя, удаляются все его посты

DELIMITER //

CREATE TRIGGER After_Delete_user
	AFTER DELETE
	ON users
	FOR EACH ROW
	BEGIN
	DELETE FROM posts
	WHERE users.id = posts.user_id;
	END //
	
DELIMITER ;

-- Процедура, которая будет показывать нам пользователя с id который мы передадим в качестве аргумента.

DELIMITER //
 
CREATE PROCEDURE get_users(id_arg INT)
BEGIN
    SELECT id, nickname
    FROM users
    WHERE id = id_arg;
END //

DELIMITER ;

CALL get_users(5);

 	