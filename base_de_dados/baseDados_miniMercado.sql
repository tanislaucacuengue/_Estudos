-- Criar a base de dados
CREATE DATABASE mini_mercado character set utf8mb4 collate utf8mb4_general_ci;

-- Usar a base de dados
USE mini_mercado;

-- Criar a tabela cliente
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome_cliente VARCHAR(150) NOT NULL,
  email_cliente VARCHAR(100)  NOT NULL,
  contacto INT(9),
  genero ENUM('F', 'M') DEFAULT 'F' 
);

describe cliente;

-- Inserir dados na tabela cliente
INSERT INTO cliente (id_cliente, nome_cliente, email_cliente, contacto, genero)
VALUES
  (default, 'Benjamim Cacuengue', 'benja@gmail.com', 92310000, 'M'),
  (default, 'Tanislau José', 'tanis@gmail.com', 92320000, 'M'),
  (default, 'Gael Cacuengue', 'gael@gmail.com', 92330000, 'M');
  
  select * from cliente;
  
  -- Criar a tabela produto
CREATE TABLE produto (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome_produto VARCHAR(150) NOT NULL,
  descricao TEXT,
  data_validade DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  preco_produto DECIMAL(6,2) NOT NULL
);

describe produto;

-- Inserir dados na tabela produto
INSERT INTO produto (id_produto, nome_produto, descricao, data_validade, preco_produto)
VALUES
  (default, 'Rebuçado', 'Açúcar solidificado com substâncias corantes.', default, 20.00),
  (default, 'Manteiga', 'Produto alimenticio estraido das natas do leite', default, 350.00),
  (default, 'Sabão', 'Substãncia química usada para lavar ou desengordurar', default, 100.00);
  
  select * from produto;
  
  CREATE TABLE pedido (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT,
  id_produto INT,
  quantidade_pedido INT,
  total INT,
  id_pagamento INT,
  data_pedido DATE DEFAULT CURRENT_TIMESTAMP,
  data_entrega DATE DEFAULT CURRENT_TIMESTAMP,
  hora TIME,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
  FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento)
);

describe pedido;

-- Inserir dados na tabela pedido
INSERT INTO pedido (id_pedido, id_cliente, id_produto, quantidade_pedido, total, id_pagamento, data_pedido, data_entrega, hora)
VALUES
  (default, '1', '1', 3, 6, '1', default, default, '13:00'),
  (default, '2', '2', 4, 8, '2', default, default, '13:00'),
  (default, '3', '3', 5, 10, '3', default, default, '13:00');
  
  select * from pedido;
  
  -- Criar a tabela pagamento
CREATE TABLE pagamento (
  id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
  tipo_pagamento VARCHAR(150) NOT NULL,
  valor_pagamento DECIMAL(6, 2) NOT NULL
);

describe pagamento;

-- Inserir dados na tabela pagamento
INSERT INTO pagamento (id_pagamento, tipo_pagamento, valor_pagamento)
VALUES
  (default, 'Via cartão multicaixa ', 350.00),
  (default, 'Via dinhero', 100.00),
  (default, 'Via multicaixa-express', 20.00);
  
  select * from pagamento;
  
-- Alteração na tabela cliente
alter table cliente change contacto cliente_contacto INT(9);
alter table cliente change genero cliente_genero ENUM('F', 'M') DEFAULT 'F';


-- Alteração na tabela produto
-- alter table produtos drop data_validade;

alter table produto change data_validade data_validade DATE DEFAULT CURRENT_TIMESTAMP;
alter table produto change descricao descricao_produto TEXT;

-- Alteração na tabela pedido

alter table pedido change total  total_pedido INT;
alter table pedido change hora  total_hora TIME;


-- Atualizar valor da tabela pagamento

update pagamento set tipo_pagamento = "Via dinhero" where id_pagamento = 3;