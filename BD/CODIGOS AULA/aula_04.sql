CREATE DATABASE loja_aula;

USE loja_aula;

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    id_categoria INT,

    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    id_cliente INT,

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);

/*INSERINDO DADOS*/

INSERT INTO categoria (nome) VALUES
('Informática'),
('Acessórios'),
('Escritório'),
('Games'),
('Celulares'),
('Eletrônicos');

INSERT INTO produto (nome, preco, estoque, id_categoria) VALUES
('Notebook Lenovo', 3500.00, 10, 1),
('Mouse Logitech', 120.00, 30, 2),
('Teclado Mecânico', 280.00, 20, 2),
('Monitor 24', 950.00, 15, 1),
('Cadeira Gamer', 1250.00, 8, 4),
('Mouse Pad', 45.00, 50, 2),
('Caneta Azul', 3.50, 100, 3),
('Caderno Executivo', 35.00, 40, 3),
('Smartphone Samsung', 2200.00, 12, 5),
('Controle Gamer', 350.00, 25, 4);

INSERT INTO produto (nome, preco, estoque, id_categoria) VALUES
('Notebook Lenovo', 3500.00, 10, 1),
('Mouse Logitech', 120.00, 30, 2),
('Teclado Mecânico', 280.00, 20, 2),
('Monitor 24', 950.00, 15, 1),
('Cadeira Gamer', 1250.00, 8, 4),
('Mouse Pad', 45.00, 50, 2),
('Caneta Azul', 3.50, 100, 3),
('Caderno Executivo', 35.00, 40, 3),
('Smartphone Samsung', 2200.00, 12, 5),
('Controle Gamer', 350.00, 25, 4);

INSERT INTO cliente (nome, cidade, data_cadastro) VALUES
('Ana Silva', 'São Paulo', '2025-02-10'),
('Bruno Costa', 'Campinas', '2025-04-15'),
('Carlos Oliveira', 'Registro', '2025-05-20'),
('Amanda Souza', 'São Paulo', '2025-07-01'),
('Mariana Santos', 'Santos', '2024-11-25'),
('Pedro Lima', 'Campinas', '2026-01-10');

INSERT INTO pedido (data_pedido, id_cliente) VALUES
('2026-08-01', 1),
('2026-08-02', 2),
('2026-08-03', 1),
('2026-08-04', 3),
('2026-08-05', 4),
('2026-08-06', 5);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 120.00),
(2, 3, 1, 280.00),
(2, 6, 3, 45.00),
(3, 4, 2, 950.00),
(3, 2, 1, 120.00),
(4, 7, 10, 3.50),
(4, 8, 3, 35.00),
(5, 5, 1, 1250.00),
(5, 10, 2, 350.00),
(6, 9, 1, 2200.00),
(6, 6, 2, 45.00);

/*CONSULTAS NO BANCO DE DADOS*/
/*LISTAGEM DE PRODUTOS*/
SELECT * FROM PRODUTO;

/*Listagem com campos especificos*/
select nome, preco from produto;

/*Listagem com condição - O gerente quer descobrir os produtos que custam mais de R$ 500,00*/
select nome, preco from produto where preco > 500;

/*Order by - Ordenação dos dados decrescente (do maior para o menor)*/
select nome, preco from produto where preco > 500 order by preco desc;

/*Order by - Ordenação dos dados ascendente (do menor para o maior)*/
select nome, preco from produto where preco > 500 order by preco asc;
#ou assim
select nome, preco from produto where preco > 500 order by preco;

/*Between - Quais os produtos custam entre R$ 100,00 e R$ 1000,00*/
select nome, preco from produto where preco between 100 and 1000 order by preco;

/*IN - A empresa realizará uma campanha somente em São Paulo e Campinas.
Quais clientes pertencem a essas cidades?*/
select nome, cidade from cliente where cidade in ('São paulo', 'Campinas');
#ou assim mais elegante
select nome, cidade from cliente where cidade = 'São Paulo' or cidade = 'Campinas';

/*Like*/
select nome from cliente where nome like "a%";
select nome from cliente where nome like "%silva";

/*Combinando filtros*/
/*Problema : Precisamos encontarr clientes de São Paulo ou Campinas, cujo nome comece com a letra "A"*/
select nome from cliente where cidade in ("São Paulo","Campinas") and nome like '%A';

/*Count - Quantos produtos exeistem na loja?*/
select count(*) as total_produtos from produto;

/* Apelido de campo, todo o campo ao ser utilizado as apelido_campo recebe um apelido de referencia ao campo, mudando assim o titulo da coluna da tabela resultado temporariamente*/

select count(nome) as "Total produtos" from produto;
#ou
select count(*) as "Total de produtos" from produto;

#AVG - Qual é o preco médio dos produtos
select avg(preco) as "Valor médio dos produtos" from produto;

#Preço méido de categoria expecífica
select avg(preco) as "Preço médio"  from produto where id_categoria=1;

#Arredondar casas decimais
select round(avg(preco),2) as "Valor médio" from produto;

#Min e Max - Qual é o produto mais caro e mais barato?
select min(preco) as "Menor valor", max(preco) as "Maior valor" from produto;

#Várias funções de agregação
select
count(*) as "Quantidade produtos",
round(avg(preco)) as "Preço médio",
min(preco) as "Menor preço",
max(preco) as "Maior preço"
from produto;

#SUM - Qual o valor financeiro aproximado od estoque dda loja?
select sum(preco) as "Total aproximado estoque" from produto;
select sum(preco * estoque) as "Total estoque" from produto;

#Agrupamento de valores - group by()
select id_categoria, round(avg(preco),2) as "Preço médio" from produto group by(id_categoria);
#ou assim trazendo o nome da categoria
select produto.id_categoria as "ID",categoria.nome as "Categoria", round(avg(preco),2) as "Preço médio" from produto 
inner join categoria on categoria.id_categoria= produto.id_categoria
 group by produto.id_categoria order by "ID";