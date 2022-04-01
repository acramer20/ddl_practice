-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;


CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name text NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text   NOT NULL,
    preferred_region_id int   NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat_name text NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id int   NOT NULL,
    title text   NOT NULL,
    contents text   NOT NULL,
    location text   NOT NULL,
    region_id int   NOT NULL,
    category_id int   NOT NULL
);

ALTER TABLE users ADD CONSTRAINT fk_users_preferred_region_id FOREIGN KEY(preferred_region_id)
REFERENCES regions (id);

ALTER TABLE posts ADD CONSTRAINT fk_posts_user_id FOREIGN KEY(user_id)
REFERENCES users (id);

ALTER TABLE posts ADD CONSTRAINT fk_posts_region_id FOREIGN KEY(region_id)
REFERENCES regions (id);

ALTER TABLE posts ADD CONSTRAINT fk_posts_category_id FOREIGN KEY(category_id)
REFERENCES categories (id);

