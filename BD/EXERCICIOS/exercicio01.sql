create database BD_Supermercado_Satio;

create table fornecedores
(
idfornec int primary key auto_increment,
nome varchar(120) not null
);

create table produtos
(
idprod int primary key auto_increment,
nome varchar(150) not null,
preco decimal(10,2) not null check(preco>=0),
qtdestoque int not null check (qtdestoque>=0),
idfornec int,
foreign key (idfornec) references fornecedores(idfornec)
);

create table compras
(
idcompra int primary key auto_increment,
qtdprodutos int,
idprod int,
foreign key (idprod) references produtos(idprod)
);

insert into fornecedores (nome) values
("Enzo Da Silva"),
("Felipe Tomechiro"),
("Hector Delaponta"),
("Gregorio Fortes");

insert into produtos (idfornec,nome,preco, qtdestoque) values
(1,"Notebook",2000.00,50.00),
(1,"Celular", 1500.00, 70.00),
(1, "Tablet", 1000.00, 100.00);

insert into produtos (idfornec,nome,preco, qtdestoque) values
(2,"Copo Stanley",70.00,40.00),
(2,"Colher Tramontina", 10.00, 70.00),
(2, "Garfo Brinox", 10.00, 80.00);

insert into produtos (idfornec,nome,preco, qtdestoque) values
(3,"Mamão Papaya",20.00,60.00),
(3,"Limão Taiti", 12.00, 50.00),
(3, "Goiaba Paluma", 14.00, 50.00);

insert into produtos (idfornec,nome,preco, qtdestoque) values
(4,"Arroz Baiano",25.00,60.00),
(4,"Feijão Caipira", 17.00, 70.00),
(4, "Macarrão Água doce", 12.00, 50.00);

insert into compras (qtdprodutos,idprod) values
(2,4),
(7,2),
(5,3);
