
sudo -u postgres psql << EOF
\x


CREATE DATABASE moviesdb1;
\c moviesdb1;


create table user_table(
    user_id VARCHAR(10) PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    addr VARCHAR(50),
    phone CHAR(20),
    password VARCHAR(10) NOT NULL,
    isManager BOOLEAN DEFAULT false NOT NULL);
    
CREATE TYPE genre_enum AS ENUM('humor', 'horror', 'action', 'adventure', 'romance', 'drama');

CREATE TABLE movie(
    movie_id SMALLSERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(20) NOT NULL,
    year CHAR(4) NOT NULL,
    revenue INTEGER DEFAULT 0 NOT NULL,
    dvd_only BOOLEAN DEFAULT false NOT NULL,
    director VARCHAR(20) NOT NULL,
    lead_actor VARCHAR(20) NOT NULL,
    genre genre_enum NOT NULL,
    avg_rating_a NUMERIC(2),
    avg_rating_b NUMERIC(2),
    avg_rating_c NUMERIC(2),
    UNIQUE(title,year));
    
CREATE TABLE person(
    person_id SMALLSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL UNIQUE);
    
CREATE TABLE acted(
    person_id SMALLINT NOT NULL REFERENCES person(person_id),
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    PRIMARY KEY(person_id,movie_id));
    
CREATE TABLE produced_by(
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    person_id SMALLINT NOT NULL REFERENCES person(person_id),
    PRIMARY KEY(person_id,movie_id));
    
CREATE TABLE movie_studio(
    studio_id SMALLSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL UNIQUE);
    
CREATE TABLE presents(
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    studio_id SMALLINT NOT NULL REFERENCES movie_studio(studio_id),
    PRIMARY KEY(movie_id,studio_id));
    
CREATE TABLE theatre(
    theatre_id SMALLSERIAL PRIMARY KEY NOT NULL,
    theatre_name VARCHAR(20) UNIQUE NOT NULL,
    cost_a SMALLINT NOT NULL,
    cost_b SMALLINT NOT NULL,
    total_seats_a SMALLINT NOT NULL,
    total_seats_b SMALLINT NOT NULL);

CREATE TABLE showing(
    theatre_id SMALLINT NOT NULL REFERENCES theatre(theatre_id),
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    time_slot SMALLINT NOT NULL,
    day DATE NOT NULL,
    filled_seats_a SMALLINT NOT NULL DEFAULT 0,
    filles_seats_b SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY(theatre_id,movie_id,time_slot,day));

CREATE TABLE rated(
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    user_id VARCHAR(10) NOT NULL REFERENCES user_table(user_id),
    rating_a SMALLINT,
    rating_b SMALLINT,
    rating_c SMALLINT);

CREATE TABLE awards(
    best_movie_movie_id SMALLINT REFERENCES movie(movie_id),
    best_director_movie_id SMALLINT REFERENCES movie(movie_id),
    best_actor_movie_id SMALLINT REFERENCES movie(movie_id),
    best_actor_id SMALLINT REFERENCES person(person_id),
    year SMALLINT PRIMARY KEY NOT NULL);

CREATE TABLE best_director(
    movie_id SMALLINT NOT NULL REFERENCES movie(movie_id),
    year SMALLINT PRIMARY KEY NOT NULL);

CREATE OR REPLACE FUNCTION calculate_average_rating() 
    RETURNS TRIGGER AS \$ratings_trigger\$
    DECLARE
        old_ratings_sum     NUMERIC(2);
        no_of_ratings       SMALLINT;
    BEGIN
        no_of_ratings =  (SELECT COUNT(*) FROM rated);
        old_ratings_sum = (SELECT avg_rating_a FROM movie WHERE movie_id=NEW.movie_id)
                                * no_of_ratings;
        no_of_ratings = no_of_ratings+1;
        old_ratings_sum=old_ratings_sum+NEW.rating_a;
        UPDATE movie SET avg_rating_a=(old_ratings_sum/(no_of_ratings))
            WHERE movie_id=NEW.movie_id;
        RETURN NULL;
    END;
\$ratings_trigger\$ LANGUAGE plpgsql;
                                
        
CREATE TRIGGER ratings_trigger
    BEFORE INSERT ON rated
    FOR EACH ROW EXECUTE PROCEDURE calculate_average_rating();

 
    
EOF


   
    
    

