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
...
 
/*9*/
select nomeCliente, email from cliente 
order by nomeCliente;
 
/*10*/
SELECT nomeFuncionario, celular FROM funcionario
ORDER BY nomeFuncionario

--------------------------------------------------
/*1*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) 
values(9, 3, now());
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) 
values(1, 3, now());
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) 
values(5, 7, 1.50, 1.50, 1);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) 
values(5, 8, 1.50, 1.50, 1);
update equipamento set qtd = qtd-1 
where idequipamento = 5;
update equipamento set qtd = qtd-1 
where idequipamento = 5;
/*2*/
INSERT INTO aluguel
(idCliente, idFuncionario,dataHoraRetirada)
VALUES(7, 2, '2025-11-20');
INSERT INTO aluguelequipamento
(idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES(5, 9, 1.50, 1.50, 1);
UPDATE equipamento SET qtd = qtd - 1
WHERE idEquipamento = 5;
 
/*3*/
insert into aluguel(idCliente, idFuncionario, dataHoraRetirada) 
values(8, 2, '2025-12-29');
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) 
values(3, 10, 2.00, 2.00, 1);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) 
values(1, 10, 4.00, 2.00, 2);
insert into aluguelEquipamento(idEquipamento, idAluguel, valorItem, valorUnitario, qtd) 
values(5, 10, 1.50, 1.50, 1);

update equipamento set qtd = (qtd-1) 
where idEquipamento = 3;
update equipamento set qtd = (qtd-2) 
where idEquipamento = 1;
update equipamento set qtd = (qtd-1) 
where idEquipamento = 5;
 
/*4*/
SELECT nomeCliente, email FROM Cliente
WHERE cidade = 'Santos'
ORDER BY nomeCliente ASC;

/*5*/
select * from cliente 
where estado in('SP', 'RJ', 'ES', 'MG');
 
select * from cliente 
where estado='SP' OR estado='RJ' OR estado='MG'
OR estado='ES'

/*6*/
SELECT * FROM cliente
WHERE idCliente >= 5 AND idCliente <= 10

/*7*/
SELECT * FROM equipamento
ORDER BY qtd DESC

/*8*/
SELECT * FROM aluguel
ORDER BY dataHoraRetirada DESC

/*9*/
UPDATE equipamento
SET valorHora = valorHora * 0.90
WHERE idEquipamento = '1'

UPDATE equipamento
SET valorHora = valorHora * 0.90
WHERE idEquipamento = '2'

/*10*/
SELECT DISTINCT Cidade FROM cliente

/*Exercicios de join*/
/*EX 1*/
INSERT INTO aluguel (idCliente, idFuncionario, dataHoraRetirada, pago)
VALUES (8, 2, '2026-11-03 16:00', 0)
INSERT INTO aluguelequipamento (idEquipamento, idAluguel, valoritem, valorunitario, qtd)
VALUES (4, 14, 3.0, 3.0, 1)

UPDATE equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 4

/*EX 2*/
SELECT
nomeFuncionario,
cpf,
dataHoraRetirada,
nomeEquipamento
FROM funcionario
JOIN aluguel
ON funcionario.idFuncionario = aluguel.idFuncionario
JOIN aluguelEquipamento
ON aluguel.idAluguel = aluguelEquipamento.idAluguel
JOIN equipamento
ON aluguelequipamento.idEquipamento = equipamento.idEquipamento

/*EX 3*/
SELECT
nomeCliente,
cliente.cpf,
dataHoraRetirada,
nomeFuncionario
FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente
JOIN funcionario
ON aluguel.idFuncionario = funcionario.idFuncionario
WHERE dataHoraRetirada LIKE ('%2024-12%')
ORDER BY dataHoraRetirada ASC

/*EX 4*/
SELECT
nomeEquipamento,
aluguelEquipamento.idEquipamento
FROM equipamento
LEFT JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
ORDER BY idEquipamento DESC

/*EX 5*/
SELECT
valorpago
dataHoraRetirada
FROM aluguel
WHERE dataHoraRetirada BETWEEN '2024-12-25' AND '2024-12-31'

/*EX 6*/
UPDATE equipamento
SET valorHora = valorHora * 0.90

UPDATE equipamento
SET valorHora = 1.50
WHERE idEquipamento = 5
('Cadeiras 02 posições', 50, 2.00),
('Cadeiras 04 posições', 100, 3.50),
('Guarda Sol P', 40, 2.00),
('Guarda Sol G', 60, 3.00),
('Mesinha', 30, 1.50);

/*EX 7*/
SELECT * FROM aluguel
UPDATE aluguel
SET formaPagamento = 'Débito'
WHERE idCliente = 8

SELECT formaPagamento,
nomeCliente
FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
ORDER BY formaPagamento ASC

/*EX 8*/
SELECT
valorpago
dataHoraRetirada
FROM aluguel
WHERE dataHoraRetirada BETWEEN '2024-12-01' AND '2024-12-31'

/*EX 9*/
DELETE FROM aluguel
WHERE idAluguel = 1

/*Nesse caso não é possível apagar pois não tem a tabela pagamento para excluir diretamente

/*EX 10*/
SELECT
nomeEquipamento,
aluguelequipamento.qtd,
dataHoraRetirada
FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
JOIN aluguel
ON aluguelequipamento.idAluguel = aluguel.idAluguel
WHERE aluguelequipamento.qtd <= 5 AND dataHoraRetirada BETWEEN '2024-12-01' AND '2024-12-31'

