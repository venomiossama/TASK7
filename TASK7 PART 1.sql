create database Movie
use Movie
go
create schema movie1
go
--Task7

--Tables:
--movie
create table movie1.Movie(
mov_id int primary key,
mov_title char (50) ,
mov_year int ,
mov_time int ,
mov_lang char (50) ,
mov_dt_rel date ,
mov_rel_country char (5) 
)
execute sp_rename 'movie1.Movie' , 'new_mov'
--movie_cast
create table movie1.movie_cast
(
act_id integer ,
mov_id int ,
role char (30) ,
primary key (mov_id ,act_id) ,
foreign key (mov_id) references movie1.new_mov(mov_id) ,
foreign key (act_id) references movie1.actor(act_id)
)

--actor
create table movie1.actor(
act_id int primary key,
act_fname char (20) ,
act_lname char (20) ,
act_gender char (1) 
)

--director
create table movie1.director
(
dir_id int primary key,
dir_fname char (20) ,
dir_lname char (20)
)

--movie_direction
create table movie1.movie_direction(
dir_id int ,
mov_id int ,
primary key (mov_id ,dir_id) ,
foreign key (mov_id) references movie1.new_mov(mov_id) ,
foreign key (dir_id) references movie1.director(dir_id)
)

--genres
create table movie1.genres(
gen_id int primary key,
gen_title char (20)
)

--movie_genres
create table movie1.movie_genres(
mov_id int ,
gen_id int ,
primary key (mov_id ,gen_id) ,
foreign key (mov_id) references movie1.new_mov(mov_id) ,
foreign key (gen_id) references movie1.genres(gen_id)

)

--reviewer
create table movie1.reviewer(
rev_id int primary key,
rev_name char (30)
)

--rating
create table movie1.rating(
mov_id int ,
rev_id int ,
rev_stars int ,
num_o_ratings int ,
primary key (mov_id ,rev_id ) ,
foreign key (mov_id) references movie1.new_mov(mov_id) ,
foreign key (rev_id) references movie1.reviewer(rev_id)
)
--TASK ENDED--
