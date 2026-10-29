-- Registos pessoais substituídos por dados fictícios para publicação.
-- criar a base de dados
create database cantina character set utf8mb4 collate utf8mb4_general_ci;

-- usar a base de dados
use  cantina;

  -- criar a tabela produto
create table produto (
  id_produto int primary key auto_increment,
  nome_produto varchar(150) not null,
  descricao text,
  data_validade time,
  preco_produto decimal(6,2) not null
);

describe produto;

-- inserir dados na tabela produto
insert into produto values(default, 'Açucar', 'Suco de cana doce solidificado.', default, 2000.00);

  select * from produto;

  create table pedido (
  id_pedido int primary key auto_increment,
  id_cliente int,
  id_produto int,
  quantidade_pedido int,
  total_pedido int,
  id_pagamento int,
  data_pedido date default current_timestamp,
  data_entrega date default current_timestamp,
  hora time,
  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_produto) references produto(id_produto),
  foreign key (id_pagamento) references pagamento(id_pagamento)
);

describe pedido;

-- inserir dados na tabela pedido
insert into pedido values(default, '1', '1', 1, 2, '1', default, default, '10:00');

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
insert into cliente values
    (default, 'Cliente de exemplo 1', 'utilizador1@example.invalid', '000000000', 'm');

  select * from cliente;


  -- criar a tabela pagamento
create table pagamento (
  id_pagamento int primary key auto_increment,
  tipo_pagamento varchar(150) not null,
  valor_pagamento decimal(6, 2) not null
);

describe pagamento;

-- inserir dados na tabela pagamento
insert into pagamento values(default, 'via dinheiro ', 2000.00);

  select * from pagamento;

-- alteração na tabela cliente
alter table cliente change contacto cliente_contacto int(9);
alter table cliente change genero cliente_genero enum('f', 'm') default 'f';



-- apagar o campo data_validade
alter table produtos drop data_validade;

-- alteração na tabela produto
alter table produto change descricao descricao_produto text;

-- alteração na tabela pedido
alter table pedido change hora  total_hora time;


-- atualizar valor da tabela pagamento
update pagamento set tipo_pagamento = "via cartão-multicaixa" where id_pagamento = 1;
