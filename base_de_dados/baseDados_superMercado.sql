-- criar a base de dados
create database super_mercado character set utf8mb4 collate utf8mb4_general_ci;

-- usar a base de dados
use  super_mercado;

  -- criar a tabela produto
create table produto (
  id_produto int primary key auto_increment,
  nome_produto varchar(150) not null,
  descricao_produto text,
  data_expiracao time,
  preco_produto decimal(6,2) not null
);

describe produto;

-- inserir dados na tabela produto
insert into produto values(default, 'Farinha', 'Igrediente usado na cozinha.', default, 2000.00);
  
  select * from produto;
  
  create table pedido (
  id_pedido int primary key auto_increment,
  id_cliente int,
  id_produto int,
  quantidade_pedido int,
  total int,
  id_pagamento int,
  data_pedido date default current_timestamp,
  data_entrega date default current_timestamp,
  total_hora time,
  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_produto) references produto(id_produto),
  foreign key (id_pagamento) references pagamento(id_pagamento)
);

describe pedido;

-- inserir dados na tabela pedido
insert into pedido values(default, '1', '1', 7, 10, '1', default, default, '18:00');
  
  select * from pedido;
  
  
-- criar a tabela cliente
create table cliente (
  id_cliente int primary key auto_increment,
  nome_cliente varchar(150) not null,
  email_cliente varchar(100)  not null,
  contacto int(9),
  genero enum('f', 'm') default 'f' 
);

describe cliente;

-- inserir dados na tabela cliente
insert into cliente values(default, 'Delcio Balamo', 'balamo@gmail.com', 92414568, 'm');
  
  select * from cliente;
  
  
  -- criar a tabela pagamento
create table pagamento (
  id_pagamento int primary key auto_increment,
  tipo_pagamento varchar(150) not null,
  valor_pagamento decimal(6, 2) not null
);

describe pagamento;

-- inserir dados na tabela pagamento
insert into pagamento values(default, 'via dinheiro ', 500.00);
  
  select * from pagamento;
  
-- alteração na tabela cliente
alter table cliente change contacto cliente_contacto int(9);
alter table cliente change genero cliente_genero enum('f', 'm') default 'f';



-- apagar o campo data_expiracao na tabela produto
alter table produtos drop data_expiracao;

-- alteração na tabela produto
alter table produto change nome nome_produto varchar(150) not null;

-- alteração na tabela pedido
alter table pedido change total  total_pedido int;


-- atualizar valor da tabela produto
update produto set preco_produto = 700.00 where id_produto = 1;
