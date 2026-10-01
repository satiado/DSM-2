#Aula 05
create database bancojava;

use bancojava;

create table cliente(
id int auto_increment primary key,
codigo int(5),
nome varchar(60),
telefone varchar(18),
email varchar(120)
);

insert into cliente(codigo,nome,telefone,email) values 
(1,'Satio','(13)98765-4321','sd@gmail');

select * from cliente;

create table usuario(
id int auto_increment primary key,
nome varchar(100),
email varchar(70), 
login varchar(80),
senha varchar(90)
);

insert into usuario(nome,email,login,senha) values 
('Satio','sd@gmail','sdf1408',12345);


#Aula Revisão da aula 05
create database bancoTPI;

use bancoTPI;
create table usuario(
id int auto_increment primary key,
codigo varchar(5),
login varchar(30), 
senha varchar(25),
telefone varchar(18)
);

insert into usuario(codigo,login,senha,telefone) values
(1,'sdf1234','1234','(13)9966-6867');

create table passagem(
id int primary key auto_increment,
codigo int,
nome varchar(50),
telefone varchar(15),
rg varchar(15),
destino varchar(50),
data varchar(10),
horario varchar(10),
poltrona varchar(5)
);

insert into passagem(codigo,nome,telefone,rg,destino,data,horario,poltrona) values
(1,'Satio Daniel','(99)99999-9999','99.999.999-99','Japão','23/12/2026','15:30',123);