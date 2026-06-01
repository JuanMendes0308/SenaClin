CREATE TABLE pizzas (
    idPizza INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);
 
INSERT INTO pizzas (nome, ingredientes, valor) VALUES
('Calabresa', 'Mussarela, calabresa fatiada e cebola', 45.50),
('Mussarela', 'Mussarela e molho de tomate', 40.00),
('Frango com Catupiry', 'Frango desfiado, catupiry e mussarela', 52.90),
('Portuguesa', 'Mussarela, presunto, ovo, ervilha, cebola e calabresa', 62.90),
('Moda do Juca', 'Mussarela, peito de peru, palmito, alho poró e alcaparras', 72.50);
 
SELECT * FROM pizzas

CREATE TABLE bebidas(
idBebida INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
qtd INT NOT NULL,
valor DECIMAL(10,2) NOT NULL
);

INSERT INTO bebidas (nome, qtd, valor)
VALUES ('Coca Cola 2L', 50, 15.90),
('Coca Cola 1L', 50, 8.90),
('Coca Cola 600ml', 50, 5.90),
('Guaraná 2L', 50, 15.90),
('Guaraná 1L', 50, 8.90),
('Guaraná 600ml', 50, 5.90),
('Suco Del Valle', 100, 9.99);

SELECT * FROM bebidas