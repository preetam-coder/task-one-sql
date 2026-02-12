CREATE TABLE author (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    published_year INT,
    author_id INT,
    category_id INT,
    
    CONSTRAINT fk_author
        FOREIGN KEY(author_id)
        REFERENCES author(author_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_category
        FOREIGN KEY(category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);


CREATE TABLE member (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);

-- ==========================
-- 5. Loan Table
-- ==========================
CREATE TABLE loan (
    loan_id SERIAL PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    
    CONSTRAINT fk_member
        FOREIGN KEY(member_id)
        REFERENCES member(member_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_book
        FOREIGN KEY(book_id)
        REFERENCES book(book_id)
        ON DELETE CASCADE
);