
ALTER TABLE person ADD COLUMN telephone varchar (255) null;

CREATE TABLE IF NOT EXISTS job (
    id int,
    job_title varchar(255),
    salary float
);