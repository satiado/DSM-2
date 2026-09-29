create database aula_06_1;
use aula_06_1;
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