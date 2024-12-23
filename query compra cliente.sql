create table pedido_cliente(
	id_pedido_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total_pedido decimal,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

create table item_pedido_cliente(
	id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_item_pedido decimal,
    status ENUM('PENDENTE', 'ACEITO', 'REJEITADO') DEFAULT 'PENDENTE',
    FOREIGN KEY (id_pedido_cliente) REFERENCES pedido_cliente(id_pedido_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

create table compra_cliente(
	id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido_cliente INT NOT NULL,
    data_compra DATE NOT NULL,
    valor_total_compra decimal,
    FOREIGN KEY (id_pedido_cliente) REFERENCES pedido_cliente(id_pedido_cliente)
);

create table item_compra_cliente(
	id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_item_pedido INT,
    FOREIGN KEY (id_item_pedido) REFERENCES item_pedido_cliente(id_item_pedido)
);