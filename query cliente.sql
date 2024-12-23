CREATE TABLE cliente (
	id_cliente int auto_increment primary key,
	nome_cliente varchar(100) NOT NULL,
	cpf_cliente varchar(18) not null,
    sexo_cliente enum("Masculino","feminino","Não binario"),
    idade_cliente int
);

create table endereco_cliente(
	id_endereco int,
	id_cliente int,
	foreign key (id_endereco) references endereco_geral (id_endereco),
	foreign key (id_cliente) references cliente (id_cliente),
	primary key(id_cliente,id_endereco)
);

create table telefone_cliente(
	id_cliente int,
	id_telefone int,
    foreign key (id_cliente) references cliente (id_cliente),
    foreign key (id_telefone) references telefone_geral (id_telefone),
    primary key (id_cliente,id_telefone)
);

create table email_cliente(
	id_cliente int,
	id_email int,
    foreign key (id_cliente) references cliente (id_cliente),
    foreign key (id_email) references email_geral (id_email),
    primary key (id_cliente,id_email)
);