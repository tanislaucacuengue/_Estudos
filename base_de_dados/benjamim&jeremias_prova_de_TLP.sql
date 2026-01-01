-- Criar a base de dados
CREATE DATABASE escola character set utf8mb4 collate utf8mb4_general_ci;

-- Usar a base de dados
USE escola;

-- Criar a tabela turno
CREATE TABLE turno (
  id_turno INT PRIMARY KEY AUTO_INCREMENT,
  nome_turno VARCHAR(20) NOT NULL,
  horario_inicio TIME NOT NULL,
  horario_fim TIME NOT NULL
);

-- Inserir dados na tabela turno
INSERT INTO turno (id_turno, nome_turno, horario_inicio, horario_fim)
VALUES
  (default, 'Manhã', '08:00:00', '12:00:00'),
  (default, 'Tarde', '13:00:00', '17:00:00'),
  (default, 'Noite', '18:00:00', '22:00:00');
  
  select * from turno;

-- Criar a tabela classe
CREATE TABLE classe (
  id_classe INT PRIMARY KEY AUTO_INCREMENT,
  nome_classe VARCHAR(20) NOT NULL,
  nivel VARCHAR(20) NOT NULL
);

-- Inserir dados na tabela classe
INSERT INTO classe (id_classe, nome_classe, nivel)
VALUES
  (default, '1ª Classe', 'Fundamental'),
  (default, '2ª Classe', 'Fundamental'),
  (default, '3ª Classe', 'Fundamental');
  
    select * from classe;

-- Criar a tabela curso
CREATE TABLE curso (
  id_curso INT PRIMARY KEY AUTO_INCREMENT,
  nome_curso VARCHAR(50) NOT NULL,
  descricao VARCHAR(200) NOT NULL
);

-- Inserir dados na tabela curso
INSERT INTO curso (id_curso, nome_curso, descricao)
VALUES
  (default, 'Ciências da Computação', 'Curso de graduação em Ciências da Computação'),
  (default, 'Engenharia Civil', 'Curso de graduação em Engenharia Civil'),
  (default, 'Medicina', 'Curso de graduação em Medicina');
  
    select * from curso;

-- Criar a tabela disciplina
CREATE TABLE disciplina (
  id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
  nome_disciplina VARCHAR(50) NOT NULL,
  carga_horaria INT NOT NULL,
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Inserir dados na tabela disciplina
INSERT INTO disciplina (id_disciplina, nome_disciplina, carga_horaria, id_curso)
VALUES
  (default, 'Matemática', 60, 1),
  (default, 'Física', 60, 2),
  (default, 'Química', 60, 3);
  
  select * from disciplina;

-- Criar a tabela professor
CREATE TABLE professor (
  id_professor INT PRIMARY KEY AUTO_INCREMENT,
  nome_professor VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  id_disciplina INT,
  FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Inserir dados na tabela professor
INSERT INTO professor (id_professor, nome_professor, endereco, telefone, id_disciplina)
VALUES
  (default, 'Bernardo Kanda', 'Rua 1, 123', '123456789', 1),
  (default, 'Ernesto Catumbela', 'Rua 2, 456', '987654321', 2),
  (default, 'Severino Vilunga', 'Rua 3, 789', '555555555', 3);
  
  select * from professor;

-- Criar a tabela turma
CREATE TABLE turma (
  id_turma INT PRIMARY KEY AUTO_INCREMENT,
  nome_turma VARCHAR(20) NOT NULL,
  id_classe INT,
  id_turno INT,
  FOREIGN KEY (id_classe) REFERENCES classe(id_classe),
  FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- Inserir dados na tabela turma
INSERT INTO turma (id_turma, nome_turma, id_classe, id_turno)
VALUES
  (default, 'Turma A', 1, 1),
  (default, 'Turma B', 2, 2),
  (default, 'Turma C', 3, 3);
  
  select * from turma;

-- Criar a tabela aluno
CREATE TABLE aluno (
  id_aluno INT PRIMARY KEY AUTO_INCREMENT,
  nome_aluno VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  id_turma INT,
  FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- Inserir dados na tabela aluno
INSERT INTO aluno (id_aluno, nome_aluno, endereco, telefone, id_turma)
VALUES
  (default, 'Benjamim Cacuengue', 'Rua 4, 123', '111111111', 1),
  (default, 'Silvia do Nascimento', 'Rua 5, 456', '222222222', 2),
  (default, 'Ivandro Panzo', 'Rua 6, 789', '333333333', 3);
  
  select * from aluno;

-- Criar a tabela prova
CREATE TABLE prova (
  id_prova INT PRIMARY KEY AUTO_INCREMENT,
  data_prova DATE NOT NULL,
  nota DECIMAL(4,2) NOT NULL,
  id_aluno INT,
  id_disciplina INT,
  FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Inserir dados na tabela prova
INSERT INTO prova (id_prova, data_prova, nota, id_aluno, id_disciplina)
VALUES
  (default, '2022-01-01', 8.5, 1, 1),
  (default, '2022-01-15', 9.0, 2, 2),
  (default, '2022-02-01', 7.5, 3, 3);
  
  select * from prova;

-- Criar a tabela funcionário
CREATE TABLE funcionario (
  id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
  nome_funcionario VARCHAR(50) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  cargo VARCHAR(20) NOT NULL
);

-- Inserir dados na tabela funcionário
INSERT INTO funcionario (id_funcionario, nome_funcionario, endereco, telefone, cargo)
VALUES
  (default, 'Delfina FFFFFFFF', 'Rua 7, 123', '444444444', 'Secretária'),
  (default, 'Monteiro de Jesus', 'Rua 8, 456', '555555555', 'Diretor'),
  (default, 'Kidima David', 'Rua 9, 789', '666666666', 'Coordenador');
  
  select * from funcionario;
  

