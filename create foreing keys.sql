USE instagram;

-- 2. Создаем все необходимые внешние ключи.

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id)
      ON DELETE CASCADE;

ALTER TABLE posts_marks
  ADD CONSTRAINT posts_marks_post_id_fk 
    FOREIGN KEY (post_id) REFERENCES posts(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT posts_marks_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
  
     
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE cascade,
  ADD CONSTRAINT posts_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE cascade;
     
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE cascade,
  ADD CONSTRAINT likes_post_id_fk 
    FOREIGN KEY (post_id) REFERENCES posts(id)
      ON DELETE cascade;
      
ALTER TABLE posts_comments 
  ADD CONSTRAINT posts_comments_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT posts_comments_post_id_fk
    FOREIGN KEY (post_id) REFERENCES posts(id)
      ON DELETE CASCADE;
     
ALTER TABLE followers
  ADD CONSTRAINT followers_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT followers_target_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT followers_target_status_id_fk 
    FOREIGN KEY (target_status_id) REFERENCES followers_statuses(id) 
      ON DELETE CASCADE;
     
     