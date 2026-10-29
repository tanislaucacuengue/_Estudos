-- Registos pessoais substituídos por dados fictícios para publicação.
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

INSERT INTO cliente (nome_cliente, email, telefone, endereco, data_nascimento, genero) VALUES

    ('Cliente de exemplo 1', 'utilizador1@example.invalid', '000000000', 'Endereco de demonstracao', '2000-01-01', 'm'),
    ('Cliente de exemplo 2', 'utilizador2@example.invalid', '000000000', 'Endereco de demonstracao', '2000-01-01', 'm'),
    ('Cliente de exemplo 3', 'utilizador3@example.invalid', '000000000', 'Endereco de demonstracao', '2000-01-01', 'm'),
    ('Cliente de exemplo 4', 'utilizador4@example.invalid', '000000000', 'Endereco de demonstracao', '2000-01-01', 'm'),
    ('Cliente de exemplo 5', 'utilizador5@example.invalid', '000000000', 'Endereco de demonstracao', '2000-01-01', 'm');

select * from produto
limit 3;

select nome_cliente from cliente
order by nome_cliente asc;
