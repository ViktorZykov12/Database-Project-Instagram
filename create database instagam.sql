-- Создаём БД
DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;

-- Делаем её текущей
USE instagram;

-- Создаём таблицу пользователей
DROP DATABASE IF EXISTS users; 
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  nickname VARCHAR (100) NOT NULL COMMENT "Никнэйм пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

-- Таблица профилей
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  gender CHAR(1) NOT NULL COMMENT "Пол",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  birthday DATE COMMENT "Дата рождения",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

-- Таблица сообщений
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_read BOOLEAN COMMENT "Признак прочитанности",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки"
) COMMENT "Сообщения";

-- Таблица постов
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "Идентификатор сроки",
  user_id INT UNSIGNED NOT null COMMENT "Ссылка на владельца поста",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  body TEXT COMMENT "Подпись поста",
  `size` INT NOT NULL COMMENT "Размер файла",
  media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT "Посты";

-- Таблица комментариев к постам
DROP TABLE IF EXISTS posts_comments;
create table posts_comments(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "Идентификатор сроки",
  user_id INT UNSIGNED NOT null COMMENT "Ссылка на пользователя",
  post_id INT UNSIGNED NOT null COMMENT "Ссылка на пост",
  comment_body TEXT COMMENT "Комментарий поста",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT "Комментарии постов";

-- Таблица типом медиафайлов
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиафайлов";

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "Идентификатор сроки",
  user_id INT UNSIGNED NOT null COMMENT "Ссылка на пользователя",
  post_id INT UNSIGNED NOT null COMMENT "Ссылка на пост",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "Лайки постов";

-- Таблица подписок
DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на подписчика",
  target_id INT UNSIGNED NOT NULL COMMENT "Ссылка на обьект подписки (пользователя)",
  target_status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус (текущее состояние) подписки",
  requested_at DATETIME DEFAULT NOW() COMMENT "Время запроса на подписку",
  confirmed_at DATETIME COMMENT "Время подтверждения запроса на подписку",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",  
  PRIMARY KEY (user_id, target_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица подписок";

-- Таблица статуса подписки
DROP TABLE IF EXISTS followers_statuses;
CREATE TABLE followers_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Статусы подписки";

-- Таблица отметок пользователей под постами
DROP TABLE IF EXISTS posts_marks;
CREATE TABLE posts_marks (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key COMMENT "Идентификатор сроки",
  post_id INT UNSIGNED NOT null COMMENT "Ссылка на пост",
  user_id INT UNSIGNED NOT null COMMENT "Ссылка на пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)COMMENT "Отметки пользователей под постами";












	













