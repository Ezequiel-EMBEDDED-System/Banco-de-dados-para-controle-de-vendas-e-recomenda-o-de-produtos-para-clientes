CREATE TABLE fornecedor(
	id_fornecedor int NOT NULL primary key,
	nome_fornecedor varchar(100) NOT NULL,
	cpf_fornecedor varchar(18) default null,
	cnpj_fornecedor varchar(22) default null
);

create table telefone_fornecedor(
	id_fornecedor int,
	id_telefone int,
	foreign key (id_fornecedor) references fornecedor (id_fornecedor),
	foreign key (id_telefone) references telefone_geral (id_telefone),
	primary key (id_fornecedor,id_telefone)
);

create table endereco_fornecedor(
	id_endereco int,
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedor (id_fornecedor),
	foreign key (id_endereco) references endereco_geral (id_endereco),
    primary key (id_fornecedor,id_endereco)
);

create table email_fornecedor(
	id_email int,
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedor (id_fornecedor),
	foreign key (id_email) references email_geral (id_email),
    primary key (id_fornecedor,id_email)
);

CREATE TABLE produto(
	id_produto int NOT NULL primary key,
	nome_produto varchar(45) NOT NULL,
	qtd_estoque int NOT NULL,
	qtd_estoque_minimo int NOT NULL,
	valor_unitario double NOT NULL,
	descricao_produto VARCHAR(400) DEFAULT NULL
);

create table categoria_produto(
	id_categoria int,
    id_produto int,
    foreign key (id_categoria) references categoria_geral (id_categoria),
    foreign key (id_produto) references produto (id_produto),
    primary key (id_categoria, id_produto)
);

CREATE TABLE produto_fornecedor(
	id_fornecedor int NOT NULL,
	id_produto int NOT NULL,
	foreign key (id_fornecedor) REFERENCES fornecedor (id_fornecedor),
	FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
	PRIMARY KEY (id_fornecedor, id_produto)
);

create table departamento(
	id_departamento int primary key,
    nome_departamento varchar(50)
);

create table categoria_departamento(
	id_departamento int,
    id_categoria int,
    foreign key (id_categoria) references categoria_geral (id_categoria),
    foreign key (id_departamento) references departamento (id_departamento),
    primary key(id_departamento,id_categoria)
);

create table pedido_fornecedor(
	id_pedido_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total_pedido decimal,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);


create table item_pedido_fornecedor(
	id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido_fornecedor INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_item_pedido decimal,
    status ENUM('PENDENTE', 'ACEITO', 'REJEITADO') DEFAULT 'PENDENTE',
    FOREIGN KEY (id_pedido_fornecedor) REFERENCES pedido_fornecedor(id_pedido_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

create table compra_fornecedor(
	id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido_fornecedor INT NOT NULL,
    data_compra DATE NOT NULL,
    valor_total_compra decimal,
    FOREIGN KEY (id_pedido_fornecedor) REFERENCES pedido_fornecedor(id_pedido_fornecedor)
);

create table item_compra_fornecedor(
	id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_item_pedido INT,
    FOREIGN KEY (id_item_pedido) REFERENCES item_pedido_fornecedor(id_item_pedido)
);