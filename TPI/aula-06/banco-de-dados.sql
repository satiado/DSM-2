create database aula_06_1;
use aula_06_1;

#exercicio 01
create table paciente(
id int primary key auto_increment,
codigo int,
nome varchar(60),
endereco varchar(120),
complemento varchar(80),
rg varchar(13),
cpf varchar(14),
data_nasc varchar(10)
);

#drop table paciente;

insert into paciente(codigo,nome,endereco,complemento,rg,cpf,data_nasc) values
(1,'Satio Daniel','Chácara paraíso','Próx barracão','99.999.999-99','999.999.999-99','14/08/2007');

#exercicio 02
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