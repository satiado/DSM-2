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
 
 /*Having - Quais categorias possuem preço médio maior que R$500,00*/
select id_categoria, round (avg(preco),2) as "Preço Médio" from produto
group by id_categoria having avg(preco) > 500;

/*Inner Join*/
select p.nome as "Produto", c.nome as "Categoria", p.preco as "Valor" from produto p 
join categoria c on p.id_categoria = c.id_categoria;
#ou assim mais reduzido a query
select p.nome as "Produto", c.nome as "Categoria", p.preco as "Valor" from produto p
join categoria c using (id_categoria);

/*Group by + inner join - Quantos produtos existem em cada categoria*/
select c.nome as "Categoria", count(p.id_produto) as "Quantidade" from categoria c
join produto p on c.id_categoria = p.id_categoria group by c.nome;

/*Left join*/
select c.nome as "Categoria", p.nome as "Produto"
from categoria c left join produto p
on c.id_categoria = p.id_categoria;

/*Quais clientes estçao cadastrados, mas nunca compraram*/
select c.nome as "Cliente" from cliente c left join pedido p
on c.id_cliente = p.id_cliente where p.id_pedido is NULL;

/*Quem comprou e em qual pedido comprou?*/
select c.nome as "Cliente", p.id_pedido, p.data_pedido from  cliente c 
 join pedido p on c.id_cliente = p.id_cliente order by c.nome;
 
 #Subconsulta
 select nome, preco from produto where preco > (select avg(preco) from produto);
 
 #Nesse exemplo, a subconsulta calcula o preço médio e a consulta externa retorna os produtos acima dessa média
 
 #Subconsulta com lista e existência
 #Quando a subconsulta retorna vários valores, usam-se os operadores IN, EXISTS, ANY e ALL. O IN verifica se um valor perence a um conjunto retornado
 #O EXISTS testa apenas se a subconsulta produz alguma linha, sendo bastante eficiente para verificar existência. O exemplo busca clientes que fizeram ao menos unm pedido
 
 select nome from cliente c where exists (select 1 from pedido p where p.id_cliente = c.id_cliente);
 
 #Subconsulta no from e no select
 #A subconsulta também pode aparecer na cláusula FROM, funcionando como uma tabela temporária, ou na linha de tabelas do SELECT,
 #retornando um valor único por linha. O exemplo a seguir mostra cada categoria ao lado da quantidade de produtos, calculada por uma subconsulta no SELECT:
 
 select c.nome,(select count(*) from produto p where p.id_categoria = c.id_categoria) as "Quantidade de Produtos" from categoria c;
 
 #Organizando com CTEs e combinando com Union
 #Consultas longas tornam se dificeis de ler quando muitas subconsultas se aninham.
 #A Commom Table Expression (CTE), introduzida pela cláusula WITH, dá o nome a um resultado intermediário e melhora a clareza
 #Ela é especialmente útil quando o mesmo subresultado é referenciado mais de uma vez.
 with faturamento_cliente as (
 select p.id_cliente, sum(ip.quantidade*ip.preco_unitario) as "Total" from pedido p
 join item_pedido ip on p.id_pedido = ip.id_pedido
 group by p.id_cliente
 )
 select c.nome, f.total from faturamento_cliente f 
 join cliente c on c.id_cliente = f.id_cliente
 where f.total > 500;
 
 #Funções Internas
 /*Os SGDBs oferecem um conjunto amplo de funções internas que processam valores durante a consulta. As funções de texto manipulam 
 cadeias de caracteres. CONCAT junta strings, UPPER e LOWER alteram a caixa, SUBSTRING extrai um trecho, LENGHT mede o comprimento 
 e TRIM remove espaços nas extremidades. */
 
 select concat(nome,'(', cidade, ')')as "Identificação",
 upper(cidade) as "Cidade em Maiusculo" from cliente;
 
 #Funções internas de data
 /*As funções de data permitem extrair e calcular informações temporais
 NOW retorna o instante atual, DATEDIFF calcular a diferença entre dataas e funções de formatação ajustam a exibição.
 O exemplo apura quantos dias cada cliente esta cadastrado*/
 
 select nome, datediff(current_date,data_cadastro) as "Dias de cadastro" from cliente;
 
 #Funções numéricas e condicionais 
 /*As funçõe snum,ériacas arredondam e ajustam valores: 
 ROUND arredonda, FLOOR e CEIL, aproximan para baixo e para cima.alterJá as funções condicionais
 decidem o valor de saída conforme uma regra. O comando CASE funciona como uma estrutura de decisão dentro da consulta
 e COALESCE substitui valores valores nulos por uma alternativa. */
 
 select nome, preco,
	case
		when preco>= 500 then "Premium"
        when preco >= 100 then "Intermediário"
        else "Econôminco"
	end as "Faixa",
    coalesce(id_categoria,0) as "Categoria segura"
from produto;

#Visões - o que são visões?
/*Uma visão, ou view é uma consulta armazenada que se comporta como uma tabela virtual. Ela não guarda dados 
próprios, mas sim uma definição de um SELECT que é execultado sempre que uma visão é consultada.
Silberschatz e colaboradores destacam qua as visõs cumprem dois papéis centrais: simplificar consultas complexas e 
controlar o que cada usuário pode enxergar */

create view vw_produtos_categorias as 
select p.id_produto, p.nome as "Produto",
p.preco, c.nome as"Categoria" from produto p
JOIN categoria c ON p.id_categoria = c.id_categoria;

/*Depois de criada, a visão é consultada com se fosse uma tabela comum,
o que dispensa repetir a junção a cada uso:*/
SELECT * FROM vw_produtos_categorias WHERE preco > 200;

#Visões como camada de segurança 
/*Além de simplificar, as visões protegem os dados.
É possivel expor apenas algumas colunas de uma tabela, 
escondendo informações sensíveis. Uma visão que mostra
clientes sem revelar o e-mail, por exemplo, permite que
relatórios sejam gerados sem dar acesso ao dado privado.
A cláusula WITH CHECK OPTION, por sua vez, impede que atualizações
feitas através da visão violem a condições que a define*/ 

create view vw_cliente_publico as
select id_cliente, nome, cidade from cliente;

select * from vw_cliente_publico;