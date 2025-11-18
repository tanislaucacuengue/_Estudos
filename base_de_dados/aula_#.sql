create database cantina character set utf8mb4 collate utf8mb4_general_ci;
use cantina;

create table cliente (
id_cliente int(9) primary key auto_increment,
nome varchar(4) not null,
contacto int(9) not null,
genero enum('M', 'F') default 'F' not null,
morada varchar(120),
n_bi varchar(70) not null
);

create table pedido (
id_pedido int(9) primary key auto_increment,
id_cliente int(9),
nome_produto varchar(50),
data_pedido date,
valor_produto decimal(3,2)
foreign key
);




