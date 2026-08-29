use loja_virtual;
select nome,preco from produto where preco > 100;

#consulta basica sem condicional
select nome,preco from produto;

#consulta basica todos os campos e todos os registros sem condicional
select * from produto;

#consulta basica todos os campos e todos os registros com condicional
select * from produto where preco > 100;

/*Buscar registro no BD na tabela clientes, retornando apenas o nome, cidade
buscando os clientes qua são das cidades ("São Paulo","Campinas"), onde o 
nome comece com a letra "A" onde a data de cadastro seja entre 01/01/2026
a 31/12/2026*/

select nome, cidade from cliente
where cidade in ('São Paulo','Campinas')
and nome like 'A%'
and data_cadastro between '2026-01-01' and '2026-12-31';

insert into cliente (nome, email, cidade) values 
('Gustavo Marcondes', 'gu.m@gmail.com','São Paulo'),
('João Victor Toth', 'jvt@mail.com','Campinas'),
('Alice Silva', 'alice.silva@outlook.com','Campinas'),
('Isis Marcondes', 'isis.mar@email.com','Cajati'),
('Iury Guedes', 'iury.guedes35@gmail.com','Registro');

/*retornar o nome, cidade, email dos clientes que possuam email
@outlook*/

select (email) from cliente
where email like '%mail%';

/*retornar produtos que tenham preço entre 50,00 a 300,00*/
select * from produto where preco between 50 and 300;