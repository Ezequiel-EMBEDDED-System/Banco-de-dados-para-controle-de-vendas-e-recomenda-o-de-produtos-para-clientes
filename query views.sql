-- view cliente info

CREATE VIEW vw_cliente_endereco_telefone AS
SELECT 
    c.id_cliente, 
    c.nome_cliente, 
    c.cpf_cliente, 
    e.tipo_logradouro, 
    e.nome_logradouro, 
    e.numero_endereco, 
    e.bairro, 
    e.cidade, 
    e.estado, 
    t.numero_telefone
FROM 
    cliente c
INNER JOIN 
    endereco_cliente ec ON c.id_cliente = ec.id_cliente
INNER JOIN 
    endereco_geral e ON ec.id_endereco = e.id_endereco
INNER JOIN 
    telefone_cliente tc ON c.id_cliente = tc.id_cliente
INNER JOIN 
    telefone_geral t ON tc.id_telefone = t.id_telefone;
    
    -- view fornecedores e produtos
    
CREATE VIEW vw_fornecedor_produto_estoque AS
SELECT 
    f.id_fornecedor, 
    f.nome_fornecedor, 
    p.id_produto, 
    p.nome_produto, 
    p.qtd_estoque
FROM 
    fornecedor f
INNER JOIN 
    produto_fornecedor pf ON f.id_fornecedor = pf.id_fornecedor
INNER JOIN 
    produto p ON pf.id_produto = p.id_produto;
    
    -- interação cliente funcionários
    
    CREATE VIEW vw_interacao_cliente_funcionario AS
SELECT 
    c.nome_cliente, 
    f.nome_funcionario, 
    ci.tipo_interacao
FROM 
    cliente_funcionario_interacao ci
INNER JOIN 
    cliente c ON ci.id_cliente = c.id_cliente
INNER JOIN 
    funcionario f ON ci.id_funcionario = f.id_funcionario;

	-- view pedidos de clientes

CREATE VIEW vw_pedido_cliente_produto AS
SELECT 
    p.id_pedido_cliente, 
    p.data_pedido, 
    p.valor_total_pedido, 
    ip.id_produto, 
    pr.nome_produto, 
    ip.quantidade, 
    ip.valor_item_pedido
FROM 
    pedido_cliente p
INNER JOIN 
    item_pedido_cliente ip ON p.id_pedido_cliente = ip.id_pedido_cliente
INNER JOIN 
    produto pr ON ip.id_produto = pr.id_produto;

