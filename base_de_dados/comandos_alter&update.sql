create database super_mercado character set utf8mb4 collate utf8mb4_general_ci;
use super_mercado;

create table produtos (

id_produto int primary key auto_increment,
nome_p varchar(100),
data_validade date,
data_entrad datetime default current_timestamp
);

describe produtos;

alter table produtos add tipo_produto varchar(100);
alter table produtos add preco_produto decimal(6,2);

alter table produtos change nome_p nome_produto varchar(200);

alter table produtos drop tipo_produto;

alter table produtos change data_entrad data_entrada datetime default current_timestamp ;

select*from produtos;

insert into produtos values
(default, "Pão", "2028-01-01", default, 200.00),
(default, "Arroz", "2028-01-01", default, 500.00),
(default, "Fuba", "2028-01-01", default, 250.00),
(default, "Rebussados", "2028-01-01", default, 20.00),
(default, "Água", "2028-01-01", default, 100.00),
(default, "Ovos", "2028-01-01", default, 150.00);


update produtos set nome_produto = "Refrijerante", preco_produto = 300.00 where id_produto = 3;

update produtos set data_validade = "2030-02-02" where id_produto = 4;