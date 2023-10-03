CREATE DATABASE antikvariat_bibliotek;

CREATE TABLE author_surnames
(
    surname_id INTEGER PRIMARY KEY IDENTITY(1,1),
    surname VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE author_forenames
(
    forename_id INTEGER PRIMARY KEY IDENTITY(1,1),
    forename VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE authors
(
    author_id INTEGER PRIMARY KEY IDENTITY(1,1),
    surname_id INTEGER NOT NULL,
    forename_id INTEGER NOT NULL,
    FOREIGN KEY (surname_id) REFERENCES author_surnames(surname_id),
    FOREIGN KEY (forename_id) REFERENCES author_forenames(forename_id)
);

CREATE TABLE publishers
(
    publisher_id INTEGER PRIMARY KEY IDENTITY(1,1),
    publisher VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE book_qualities
(
    book_quality_id INTEGER PRIMARY KEY IDENTITY(1,1),
    book_quality VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE book_titles
(
    book_title_id INTEGER PRIMARY KEY IDENTITY(1,1),
    book_title VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE books
(
    book_id INTEGER PRIMARY KEY IDENTITY(1,1),
    book_title_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    publisher_id INTEGER NOT NULL,
    published_year YEAR NOT NULL,
    book_quality_id INTEGER NOT NULL,

    FOREIGN KEY (book_title_id) REFERENCES book_titles(book_title_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
    FOREIGN KEY (book_quality_id) REFERENCES book_qualities(book_quality_id)
);

