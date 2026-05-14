INSERT INTO paciente 
(nome, email, celular, cpf, 
cep, tipolog,logradouro, 
numero, complemento, 
cidade, uf, dataNascimento)
VALUES 
('Maria','maria@ig.com.br',
'13999887744','2226668899',
'11030222','Praça',
'Julio Peres','20',NULL,
'Santos','SP',
'1970-01-07');
 
INSERT INTO paciente 
(nome, email, celular, cpf, 
cep, tipolog,logradouro, 
numero, complemento, 
cidade, uf, dataNascimento)
VALUES 
('Roberta','roberta@uol.com.br',
'13923887744','2226668800',
'11030122','Av',
'Ana Costa','21','ap 77',
'Santos','SP',
'1999-08-18');
 
 
INSERT INTO paciente 
(nome, email, celular, cpf, 
cep, tipolog,logradouro, 
numero, complemento, 
cidade, uf, dataNascimento)
VALUES 
('Lucas','lucas@ig.com.br',
'11999887744','2226668888',
'11030111','Avenida',
'Paulista','1900','ap 65',
'São Paulo','SP',
'1980-07-22'),
('Renan','renan@ig.com.br',
'11999887711','9876668888',
'41030111','Avenida',
'Rebouças','101','ap 122',
'São Paulo','SP',
'1983-09-02'),
('Rebeca','rebeca@bol.com.br',
'11999887711','9876668000',
'45030111','Rua',
'Ricardo Marcarenhas','89','ap 12',
'São Paulo','SP',
'1992-11-15');
/*Atualizar*/   
UPDATE paciente
SET uf='SP',
    dataNascimento='1992-11-17'
WHERE idPaciente=1
/*Excluir*/   
DELETE FROM paciente WHERE idPaciente=1
 
SELECT * FROM paciente
SELECT NOW()
 
/*Buscas e Filtros*/
SELECT nome, email FROM paciente
SELECT * FROM paciente
 
SELECT * FROM paciente
WHERE cidade='Santos'
 
SELECT * FROM paciente 
WHERE idpaciente<=4
 
SELECT * FROM paciente 
WHERE idpaciente>=5
 
SELECT * FROM paciente 
WHERE idpaciente>=3 AND idpaciente<=5
 
SELECT * FROM paciente 
WHERE idpaciente BETWEEN 3 AND 5
 
/* Listar nome, email e celular de todos
os pacientes que moram em Avenida */
 
SELECT nome,email,celular, tipolog FROM paciente
WHERE tipolog='Avenida'
 
SELECT nome,email,celular, tipolog FROM paciente
WHERE tipolog='Avenida' OR tipolog='Av' OR tipolog='Av.'
 
SELECT nome,email,celular, tipolog FROM paciente
WHERE tipolog LIKE 'Av%'
 
SELECT nome, cidade, uf FROM paciente
WHERE cidade LIKE '%u%'
 
SELECT nome, cidade, uf FROM paciente
WHERE cidade IN ('Cubatão','Santos')
 
/*Ordenar dados*/
SELECT nome, cidade, dataNascimento FROM paciente
ORDER BY dataNascimento ASC
 
SELECT nome, cidade FROM paciente
ORDER BY nome DESC
 
/*Filtrar e ordenar*/
SELECT nome, cidade, uf, celular FROM paciente 
WHERE cidade='São Paulo'
ORDER BY nome ASC
 
/*Listar os distintos*/
SELECT distinct cidade FROM paciente


CREATE TABLE Funcionario(
    idFuncionario int PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario varchar(50) not null,
    cpf char(11) not NULL unique,
    celular char(11) not null
);

CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL unique
);
 
CREATE TABLE Equipamento(
idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
nomeEquipamento VARCHAR(50) NOT NULL UNIQUE,  
qtd INT NOT NULL,
valorHora DECIMAL(10,2) NOT NULL
);
 
CREATE TABLE Aluguel (
idAluguel INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT NOT NULL,
idFuncionario INT NOT NULL,
dataHoraRetirada DATETIME DEFAULT NOW(),
dataHoraDevolucao DATETIME,
valorApagar DECIMAL(10,2),
valorPago DECIMAL(10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtVezes INT DEFAULT 1,
CONSTRAINT FK_Aluguel_Cliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
CONSTRAINT FK_Aluguel_Funcionario
FOREIGN KEY (idFuncionario) REFERENCES funcionario
(idFuncionario)
);
 
CREATE TABLE AluguelEquipamento(
idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idEquipamento INT NOT NULL,
idAluguel INT NOT NULL,
valorItem DECIMAL(10,2) NOT NULL,
valorUnitario DECIMAL(10,2) NOT NULL,
qtd INT DEFAULT 1,
FOREIGN KEY (idEquipamento)
REFERENCES equipamento(idEquipamento),
FOREIGN KEY (idAluguel)
REFERENCES aluguel(idAluguel)
);
SELECT * FROM funcionario
/*1*/
 
alter table cliente add COLUMN
email varchar(150) unique not NULL;
 
alter table cliente add COLUMN
cidade varchar(50) not null;
 
alter table cliente add COLUMN
estado char(2) not NULL;
 
/*2*/
 
INSERT INTO  cliente (nomeCliente, cpf, email, cidade, estado)
VALUES
('Donald','41578029874',
'donald@uol','Santos',
'SP'),
('Margarida','02589641587',
'margarida@uol','São Vicente',
'SP'),
('Patinhas','36985472103',
'patinhas@uol','Florianópolis',
'SC'),
('Huguinho','01245789630',
'huguinho@gmail','Santos',
'SP'),
('Luizinho','45781029874',
'luizinho@gmail','Praia Grande',
'SP'),
('Zezinho','02158639742',
'zezinho@gmail','São Vicente',
'SP'),
('Pardal','03697841520',
'pardal@uol','Santos',
'SP'),
('Zé Carioca','02151024780',
'zecarioca@uol','Rio de Janeiro',
'RJ'),
('Mickey','02360120965',
'mickey@hotmail','Recife',
'PE'),
('Minie','02102450690',
'minie@gmail','Recife',
'PE'),
('Pateta','021020542102',
'pateta@gmail','Santos',
'SP'),
('Branca de Neve','01245810201',
'brancadeneve@hotmail','São Joaquim',
'SC'),
('Aladin','01245789520',
'aladin@gmail','Belém',
'PA'),
('Cinderela','01254876201',
'cinderela@hotmail','Goiania',
'GO'),
('Mulan','01245782501',
'mulan@gmail','Rio das Ostras',
'RJ'),
('Moana','01021054207',
'moana@gmail','Parati',
'RJ'),
('Asnésio','01202236541',
'asnesio@uol','Belo Horizonte',
'MG'),
('Maga Patalógica','01245784102',
'maga@gmail','Cubatão',
'SP'),
('Capitão Boeing','01201548741',
'capitaoboeing@uol','Manaus',
'AM'),
('Pão Duro Mac Money','01245852012',
'paoduro@ig','Osasco',
'SP');
 
/*3*/
 
INSERT INTO Funcionario (nomeFuncionario, cpf, celular) VALUES
('Cebolinha', '11122233344', '13991111111'),
('Cascão', '55566677788', '13992222222'),
('Chico Bento', '99900011122', '13993333333');
 
/*4*/
 
INSERT INTO equipamento
(nomeEquipamento, qtd, ValorHora) VALUES
('Cadeiras 02 posições', 50, 2.00),
('Cadeiras 04 posições', 100, 3.50),
('Guarda Sol P', 40, 2.00),
('Guarda Sol G', 60, 3.00),
('Mesinha', 30, 1.50);
 
/*5*/
 
insert into
    aluguel (
        idCliente,
        idFuncionario,
        dataHoraRetirada
    )
 
values (11, 1, '2024-12-08');
 
insert into
    aluguelEquipamento (
        idEquipamento,
        idAluguel,
        valorItem,
        valorUnitario,
        qtd
    )
 
values (1, LAST_INSERT_ID() , 2.00, 2.00, 1);
 
update equipamento set qtd = (qtd - 1)
where idEquipamento = 1;
 
/*6*/
 
INSERT INTO aluguel
(idCliente, idFuncionario, dataHoraRetirada) values
(9,3,'2024-12-10');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES (2,2,7.00,3.50,2);
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES (4,2,3.0,3.0,1);
 
UPDATE equipamento SET qtd = qtd - 2
WHERE idEquipamento = 2;
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 4;
 
/*7*/
 
/* aluguel 3*/
 
INSERT INTO aluguel
(idCliente, idFuncionario, dataHoraRetirada)
VALUES (15,1,'2024-12-27');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES (3,3,2.00,2.00,1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 3;
 
/* aluguel 4*/
 
INSERT INTO aluguel
(idCliente, idFuncionario, dataHoraRetirada)
VALUES (14,1,'2024-12-27');

INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES (3,4,2.00,2.00,1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 3;
 
/* aluguel 5*/
 
INSERT INTO aluguel
(idCliente, idFuncionario, dataHoraRetirada)
VALUES (10,1,'2024-12-27');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES (3,5,2.00,2.00,1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 3;
 
/*8*/

 
 
/*9*/
 
select nomeCliente, email from cliente
 
order by nomeCliente;
 
/*10*/
 
SELECT nomeFuncionario, celular FROM funcionario
 
ORDER BY nomeFuncionario
INSERT INTO aluguel
 
(idCliente, idFuncionario, dataHoraRetirada)
 
-- Os valores dos aluguéis
 
UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Pix'
WHERE idAluguel = 1;
 
 
UPDATE aluguel
SET valorApagar = 10.00,
    valorPago = 10.00,
    pago = 1,
    formaPagamento = 'Cartao'
WHERE idAluguel = 2;
 
 
UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 0.00,
    pago = 0,
    formaPagamento = NULL
WHERE idAluguel = 3;
 
 
UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Dinheiro'
WHERE idAluguel = 4;
 
 
UPDATE aluguel
SET valorApagar = 2.00,
    valorPago = 2.00,
    pago = 1,
    formaPagamento = 'Pix'
WHERE idAluguel = 5;
 
 
UPDATE aluguel
SET valorApagar = 1.50,
    valorPago = 0.00,
    pago = 0,
    formaPagamento = NULL
WHERE idAluguel = 6;
 
 
UPDATE aluguel
SET valorApagar = 1.50,
    valorPago = 1.50,
    pago = 1,
    formaPagamento = 'Cartao'
WHERE idAluguel = 7; 
SELECT * FROM cliente
 
SELECT * FROM aluguel
 
SELECT * FROM funcionario
 
SELECT * FROM equipamento
 
SELECT * FROM aluguelequipamento
SELECT * FROM aluguel 
 
SELECT * FROM funcionario
 
SELECT * FROM cliente
 
SELECT * FROM equipamento
 
INSERT INTO aluguel
(idCliente, idFuncionario,dataHoraRetirada)
VALUES(1, 3, '2026-04-27');
 
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(5, 6, 1.50, 1.50, 1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 5;
 
INSERT INTO aluguel
(idCliente, idFuncionario,dataHoraRetirada)
VALUES(9, 3, '2026-04-27');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(5, 7, 1.50, 1.50, 1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 5;
 
-- EX 2
 
INSERT INTO aluguel
(idCliente, idFuncionario,dataHoraRetirada)
VALUES(7, 2, '2025-11-20');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(5, 8, 1.50, 1.50, 1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 5;
 
-- EX 3
 
INSERT INTO aluguel
(idCliente, idFuncionario,dataHoraRetirada)
VALUES(8, 2, '2025-12-29');
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(3, 9, 2.0, 2.0, 1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 3;
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(1, 9, 2.0, 2.0, 2);
 
UPDATE equipamento SET qtd = qtd - 2
WHERE idEquipamento = 1;
 
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(5, 9, 1.50, 1.50, 1);
 
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 5;
 
-- EX 4
 
SELECT nomeCliente, email FROM Cliente
 
WHERE cidade = 'Santos'
 
ORDER BY nomeCliente ASC;
 
-- EX 5
 
 
SELECT * FROM cliente
 
WHERE estado in ('SP', 'RJ', 'ES', 'MG');

-- EX 6
SELECT * FROM cliente
 
WHERE idcliente >=5 AND idcliente <=10;
-- EX 7
 
SELECT * FROM equipamento
 
order by qtd DESC;
-- EX 8
 
SELECT * FROM aluguel
 
order by dataHoraRetirada DESC;
-- EX 9
 
UPDATE equipamento
 
SET valorHora = valorHora * 0.90
 
WHERE idEquipamento = '1'
UPDATE equipamento
 
SET valorHora = valorHora * 0.90
 
WHERE idEquipamento = '2'
-- EX 10
 
SELECT distinct cidade FROM cliente
SELECT * FROM aluguel