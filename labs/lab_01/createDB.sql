create database MusicSchool

create schema sc1

create table sc1.Composer(
	id int generated by default as identity 
	(start with 1 increment by 1) primary key,
	fullName text not null,
	gender varchar(6) not null,
	lifeYear text,
	nationality text
)

create table sc1.Composition(
	id int generated by default as identity 
	(start with 1 increment by 1) primary key,
	title text not null,
	tonality text not null, 
	amount int check (amount > 0),
	composerid int not null references sc1.Composer (id)
)

create table sc1.Student(
	id int generated by default as identity 
	(start with 1 increment by 1) primary key,
	fullName text not null,
	gender varchar(6) not null,
	form int check (form > 0 and form < 8),
	speciality text
)

create table sc1.Teacher(
	id int generated by default as identity 
	(start with 1 increment by 1) primary key,
	fullName text not null,
	gender varchar(6) not null,
	age int check (age > 0),
	education text
)

create table sc1.Exam(
	id int generated by default as identity 
	(start with 1 increment by 1) primary key,
	studentid int not null references sc1.Student (id),
	teacherid int not null references sc1.Teacher (id),
	compositionid int not null references sc1.Composition (id),
	mark int not null check (mark > 1),
	date date not null
)