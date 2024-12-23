CREATE TABLE cargo (
    id_cargo INT AUTO_INCREMENT NOT NULL,
    nome_cargo VARCHAR(50) NOT NULL,
    salario_cargo INT NOT NULL,
    PRIMARY KEY (id_cargo)
);

CREATE TABLE funcionario (
id_funcionario int(11) NOT NULL,
nome_funcionario varchar(100) NOT NULL,
id_cargo int not null,
PRIMARY KEY (id_funcionario),
foreign key (id_cargo) references cargo(id_cargo)
);

CREATE TABLE tarefa (
  id_tarefa int(11) NOT NULL,
  id_funcionario int(11) NOT NULL,
  data_criacao date,
  data_conclusao date,
  PRIMARY KEY (id_tarefa),
  KEY fk_funcionario_tarefa (id_funcionario),
  CONSTRAINT fk_funcionario_tarefa FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);

