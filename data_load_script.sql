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
insert into person(name) values('Matthew McConaughey'),('Anne Hathaway'),('Michael Caine');
/* no prod for John Wick*/
/* actors for john wick*/
insert into person(name) values('Keanu Reeves'), ('Bridget Moynahan');
/* prod for Gone girls*/
insert into person(name) values('Leslie Dixon'),('Bruna Papandrea'),('Reese Witherspoon');
/* actors for Gone girls*/
insert into person(name) values('Ben Affleck'),('Rosamund Pike'),('Neil Patrick Harris');
/* no prod for Horns*/
/* actors for Horns*/
insert into person(name) values('Daniel Radcliffe'),('Max Minghella'),('Joe Anderson');
/* prod for hunger games*/
insert into person(name) values('Nina Jacobson'),('Jon Kilik');
/* actors for hunger games*/
insert into person(name) values('Stanley Tucci'),('Wes Bentley'),('Jennifer Lawrence');
/* prod for conjuring*/
insert into person(name) values('Peter Safran'),('Tony DeRosa-Grund'),('Rob Cowan');
/* actors for conjuring*/)
insert into person(name) values('Vera Farmiga'),('Patrick Wilson'),('Lili Taylor');

/* adding actor entries for movies*/
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Fury' and p.name in ('Brad Pitt','Shia LaBeouf','Logan Lerman')  and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Inception' and p.name in ('Leonardo DiCaprio','Joseph Gordon-Levitt','Ellen Page','Tom Hardy','Ken Watanabe') 
    and m.year=2011);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Interstellar' and p.name in ('Matthew McConaughey','Anne Hathaway','Michael Caine') and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='John Wick' and p.name in ('Keanu Reeves','Bridget Moynahan') and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Gone Girls' and p.name in ('Ben Affleck','Rosamund Pike','Neil Patrick Harris') and m.year=2014);

insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Horns' and p.name in ('Daniel Radcliffe','Max Minghella','Joe Anderson') and m.year=2013);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='The Hunger Games' and p.name in ('Stanley Tucci','Wes Bentley','Jennifer Lawrence') and m.year=2013);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='The Conjuring' and p.name in ('Vera Farmiga','Patrick Wilson','Lili Taylor') and m.year=2013);
    
/* adding producers*/
insert into produced_by(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Fury' and p.name in ('John Lesher','Bill Block','Ethan Smith')  and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Inception' and p.name in ('Emma Thomas','Christopher Nolan') 
    and m.year=2011);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Interstellar' and p.name in ('Emma Thomas','Christopher Nolan','Lynda Obst') and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='Gone Girls' and p.name in ('Leslie Dixon','Bruna Papandrea','Reese Witherspoon') and m.year=2014);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='The Hunger Games' and p.name in ('Nina Jacobson','Jon Kilik') and m.year=2013);
    
insert into acted(person_id,movie_id) (
    select m.movie_id, p.person_id from movie as m, person as p 
    where m.title='The Conjuring' and p.name in ('Peter Safran','Tony DeRosa-Grund','Rob Cowan') and m.year=2013);


    


