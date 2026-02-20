create database loja character set utf8mb4 collate utf8mb4_general_ci;

use loja;

create table produto(
	id_produto int primary key auto_increment,
    nome_produto varchar(150),
    categoria varchar(50),
    preco decimal(6,3),
    quantidade int(30),
    data_entrada date default current_timestamp,
    data_validade date,
    fornecedor varchar(100)
);

create table cliente(
	id_cliente int primary key auto_increment,
    nome_cliente varchar(200),
    email varchar(100),
    telefone varchar(13),
    endereco varchar(150),
    data_nascimento date, 
    genero enum('f', 'm') default 'f'
);


insert into produto (nome_produto, categoria, preco, quantidade, data_entrada, data_validade, fornecedor)
values('Pão', 'Alimentar', 2500.00, 200, default, '2027-02-10', 'Padaria Pão doce'),
('Sabão', 'Limpeza', 500.00, 900, default, '2027-02-10', 'Empresa Limpa limpa'),
('Leite', 'Bebidas', 800.00, 400, default, '2027-02-10', 'Fazenda Leite Bom'),
('Açucar', 'Alimentar', 600.00, 120, default, '2027-02-10', 'Padaria Pão doce'),
('Sumo', 'Bebidas', 350.00, 20, default, '2027-02-10', 'Empresa Refriango');

INSERT INTO cliente (nome_cliente, email, telefone, endereco, data_nascimento, genero)
VALUES
('Benjamim Cacuengue', 'benja@gmail.com', '920000000', 'Luanda', '200#-02-10', 'm'),
('Jeremias Zangui zua', 'zua@gmail.com', '923333333', 'Viana', '200#-04-10', 'm'),
('Guilherme Jaime', 'gui@gmail.com', '924444444', 'Kilamba Kiaxi', '200#-04-10', 'm'),
('Denilson Morais', 'deni@gmail.com', '926666666', 'Zango', '200#-05-10', 'm'),
('Isaac Mulai antonio', 'mulai@gmail.com', '92777777', 'Belas', '200#-05-10', 'm');

select * from produto
limit 3;

select nome_cliente from cliente
order by nome_cliente asc;
