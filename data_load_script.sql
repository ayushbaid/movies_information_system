/*
*how to execute:
*database-# >@pathof_mysqlfile.sql
*or
*database-#>-i pathof_mysqlfile.sql
*or
*database-#>-c pathof_mysqlfile.sql
*/

/*
* insert into movies
* DATA SOURCES - 
* 1) http://www.imdb.com/search/title?year=2014,2014&title_type=feature&sort=moviemeter,asc
* 2) http://www.imdb.com/search/title?year=2013,2013&title_type=feature&sort=moviemeter,asc
*/
insert into movie(title,year,director,lead_actor,genre) 
    values('Fury',2014,'David Ayer','Brad Pitt','action');
insert into movie(title,year,director,lead_actor,genre) 
    values('Inception',2011,'Christopher Nolan','Leonardo DiCaprio','action');
insert into movie(title,year,director,lead_actor,genre) 
    values('Interstellar',2014,'Christopher Nolan','Matthew McConaughey','adventure');
insert into movie(title,year,director,lead_actor,genre) 
    values('John Wick',2014,'David Leitch','Keanu Reeves','action');
insert into movie(title,year,director,lead_actor,genre) 
    values('Gone Girl',2014,'David Fincher','Ben Affleck','drama');
insert into movie(title,year,director,lead_actor,genre) 
    values('Horns',2013,'Alexandre Aja','Daniel Radcliffe','horror');
insert into movie(title,year,director,lead_actor,genre) 
    values('The Hunger Games',2013,'Francis Lawrence','Jennifer Lawrence','adventure');
insert into movie(title,year,director,lead_actor,genre) 
    values('The Conjuring',2013,'James Wan','Patrick Wilson','horror');
    
    
/*
* inserting the actors/producers and theatre owners in the person table
*/

/* producers for fury*/
insert into person(name) values('John Lesher'), ('Bill Block'), ('Ethan Smith');
/* actors for fury*/
insert into person(name) values('Brad Pitt'),('Shia LaBeouf'),('Logan Lerman');
/* prod. for inception*/
insert into person(name) values('Emma Thomas'),('Christopher Nolan');
/* actors for inception*/
insert into person(name) values('Leonardo DiCaprio'),('Joseph Gordon-Levitt'),('Ellen Page'),('Tom Hardy'),('Ken Watanabe'),(Michael Caine);
/* prod. for interstellar*/
insert into person(name) values('Emma Thomas'),('Christopher Nolan'),('Lynda Obst');
/* actors for interstellar*/
insert into person(name) values('Matthew McConaughey'),('Anne Hathaway 	Anne Hathaway '),('Michael Caine');
/* prod for John Wick*/
insert into person(name) values

    


