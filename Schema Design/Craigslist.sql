DROP DATABASE IF EXISTS Craigslist;

CREATE DATABASE Craigslist;

\c Craigslist

CREATE TABLE Post_Regions(
    region_id SERIAL PRIMARY KEY,
    region TEXT UNIQUE NOT NULL
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    preferred_region TEXT NOT NULL
    CONSTRAINT fk_Users_region_id FOREIGN KEY (preferred_region) REFERENCES Post_Region(region)
);

CREATE TABLE Categories (
    cat_id SERIAL PRIMARY KEY,
    cat_name TEXT UNIQUE NOT NULL
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(15) NOT NULL,
    post_text TEXT,
    post_location TEXT,
    user_id INTEGER REFERENCES Users(user_id),
    region_id INTEGER REFERENCES Post_Regions(region_id),
    category_id INTEGER REFERENCES Categories(cat_id)
);

