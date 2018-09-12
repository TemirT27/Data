create database lab2;

create table countries (
  country_id   serial constraint countries_pkey primary key,
  country_name varchar(50),
  region_id    int,
  population   int
);
  select * from countries;

  insert into countries values (default,'Kaz',9,10000);

  insert into countries (country_id,country_name) values (default,'Rus');

  update countries set region_id = null;

  insert into countries values(default,'UA',10,5000),(default ,'China',65,10000),(default ,'Russia',55,9000);

  alter table countries alter column country_name set default 'Kazakhstan';

  insert into countries values(7,default ,50,444444);

  insert into countries (country_id,country_name) values (default ,default );

  create table  countries_new(like countries);

  insert into countries_new select * from countries;

  select * from countries_new;

  update countries_new set region_id = 1 where region_id is null;

  update countries_new set population = population + (population*0.1) returning  country_name,population as "New Population";

  delete from countries_new as cn using countries co where cn.country_id=co.country_id returning *;
  delete from countries returning *;
