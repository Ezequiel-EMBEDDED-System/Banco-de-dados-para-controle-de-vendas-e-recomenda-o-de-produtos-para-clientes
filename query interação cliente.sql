CREATE TABLE cliente_funcionario_interacao (
	id_interacao int primary key,
	id_cliente int,
    id_funcionario int,
	tipo_interacao enum("E-mail","Telefone","Presencial",""),
    foreign key (id_cliente) references cliente (id_cliente),
    foreign key (id_funcionario) references funcionario (id_funcionario)
);

create table interacao_cliente_produto(
	id_interacao int primary key,
    tempo_interacao time,
    id_cliente int,
    id_produto int,
    foreign key (id_cliente) references cliente (id_cliente),
    foreign key (id_produto) references produto (id_produto)
);

create table preferencia_cliente (
	id_preferencia int not null auto_increment,
	id_cliente int,
    id_categoria int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_categoria) references categoria_geral(id_categoria),
	primary key(id_preferencia,id_cliente)
);