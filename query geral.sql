CREATE TABLE endereco_geral (
id_endereco int auto_increment primary key,
tipo_logradouro varchar(30) not null,
nome_logradouro varchar(150) not null,
numero_endereco int,
bairro varchar(50) not null,
cidade varchar(50) not null,
estado varchar(50) not null,
complemento varchar(150)
);

create table telefone_geral(
id_telefone int primary key,
numero_telefone varchar(20) not null
);

create table email_geral(
id_email int primary key,
email varchar(100) NOT NULL
);

create table categoria_geral(
	id_categoria int primary key,
    nome_categoria varchar(30),
    descricao_categoria varchar(200)
);
