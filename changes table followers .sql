USE instagram;

ALTER TABLE followers RENAME COLUMN user_id TO follower_id;

ALTER TABLE followers RENAME COLUMN target_id TO followed_id;

ALTER TABLE followers RENAME COLUMN target_status_id TO subscription_status_id;

RENAME TABLE followers_statuses TO subscriptions_statises;