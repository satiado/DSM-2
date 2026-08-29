create database Oficina_Satio;

create table clientes
(
cliente_id int primary key auto_increment,
nome varchar(120) not null,
endereco varchar(150) not null,
telefone varchar(11) not null
);

create table veiculos
(
veiculo_id int primary key auto_increment,
clientes_id int,
placa varchar(8) unique not null,
modelo varchar(50) not null,
ano year not null,
foreign key (clientes_id) references clientes(cliente_id)
);

create table ordens_de_servico
(
ordem_id int auto_increment primary key,
veiculo_id int,
data_entrada date, 
data_saida date,
descricao varchar(200),
status enum("aberto", "em andamento", "concluido", "cancelada"),
foreign key (veiculo_id) references veiculos(veiculo_id)
);

insert into clientes(nome, endereco, telefone) values
('João Silva','Rua das Flores,123','1234-5678'),
('Maria Oliveira','Avenida Centraal,456','2345-6789'),
('Pedro Santos','Rua do comércio,789','3456-7890'),
('Ana Costa','Praça da Liberdade,101','4567-8901');

insert into veiculos(clientes_id,placa,modelo,ano) values
(1,'ABC-1234','Fusca',1978),
(2,'XYZ-5678','Civic',2020),
(3,'DEF-9876','Corolla',2015),
(4,'GHI-5432','Onix',2022);

insert into ordens_de_servico(veiculo_id, data_entrada,data_saida,descricao,status) values
(1,'2024-08-01','2024-08-05','Troca de óleo e revisão geral','concluido'),
(2, '2024-08-10',null, 'Alinhamento e balanceamento','em andamento'),
(3,'2024-08-15','2024-08-20','Troca de pneu e alinhamento','concluido'),
(4,'2024-08-20',null, 'Revisão completa e troca de óleo','aberto');

#Exercicio 01
select * from clientes;

#Exercicio 02
select * from veiculos where ano = '2020';

#Exercicio 03
select * from ordens_de_servico where status like 'em andamento';

#exercicio 04
select * from ordens_de_servico where data_saida between '2024-08-01' and '2024-08-15';