USE instagram;

-- Изменения в таблице profiles столбце gender
ALTER TABLE profiles modify column gender ENUM('MALE','FEMALE');