create database lab1;

create table users (
  id SERIAL CONSTRAINT users_pkey PRIMARY KEY,
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL
);
alter table users add isadmin int not null default  0;

insert into users (firstname, lastname, isadmin) values ('Sam', 'Kan', 15);

alter table users alter column isadmin drop default;
alter table users alter column isadmin type boolean using case when isadmin=0 then false else true end;
alter table users alter column isadmin set default false;

create table tasks (
  id serial constraint tasks_pkey primary key,
  name varchar(50) not null,
  user_id int
);
drop table tasks;
drop database lab1;