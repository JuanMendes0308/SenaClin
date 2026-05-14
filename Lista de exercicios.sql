/*EX 1*/
SELECT * FROM cliente

/*EX 2*/
SELECT nomeCliente, dataHoraRetirada FROM cliente
JOIN aluguel
ON cliente.idCliente = aluguel.idCliente

/*EX 3*/
SELECT nomeEquipamento, aluguelequipamento.qtd, dataHoraRetirada FROM Equipamento 
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
JOIN aluguel
ON aluguelequipamento.idAluguel = aluguel.idAluguel
ORDER BY dataHoraRetirada ASC

/*EX 4*/
SELECT nomeFuncionario, dataHoraRetirada FROM funcionario
JOIN aluguel
ON funcionario.idFuncionario = aluguel.idFuncionario

/*EX 5*/
SELECT COUNT(*) AS 'Qtd clientes' FROM cliente

/*EX 6*/
SELECT nomeCliente, COUNT(*) AS 'Qts aluguéis' FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
GROUP BY nomeCliente

/*EX 7*/
SELECT MAX(valorPago) AS 'Maior valor Pago' FROM aluguel

/*EX 8*/
SELECT MIN(valorPago) AS 'Menor valor Pago' FROM aluguel

/*EX 9*/
SELECT AVG(valorPago) AS 'Média Valor dos aluguéis' FROM aluguel

/*EX 10*/
SELECT SUM(valorPago) AS 'Total arrecadado dos aluguéis' FROM aluguel
WHERE DAY('2026-05-11')

/*EX 11*/
SELECT nomeEquipamento, qtd FROM equipamento
WHERE qtd >= 40

/*EX 12*/
SELECT dataHoraRetirada, valorPago, formaPagamento FROM aluguel
WHERE formaPagamento = 'Débito' OR formaPagamento = 'Crédito'

/*EX 13*/
SELECT nomeCliente, COUNT(*) AS 'Qtd aluguéis realizados' FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
GROUP BY nomeCliente
HAVING COUNT(*) >=2

/*EX 14*/
SELECT nomeEquipamento, SUM(valorPago) AS 'Total arrecadado de cada aluguel' FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
JOIN aluguel
ON aluguelequipamento.idAluguel = aluguel.idAluguel
GROUP BY nomeEquipamento

/*EX 15*/
SELECT nomeCliente, SUM(valorPago) AS 'Valor movimentado por cliente' FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
JOIN aluguelequipamento
ON aluguel.idAluguel = aluguelequipamento.idAluguel
GROUP BY nomeCliente

/*EX 16*/
SELECT nomeEquipamento, AVG(valorHora) AS 'Média de valor' FROM equipamento
WHERE valorHora > (SELECT AVG(valorHora)FROM equipamento)
GROUP BY nomeEquipamento

/*EX 17*/
SELECT nomeFuncionario, COUNT(*) AS 'Qtd de aluguéis realizados' FROM funcionario
JOIN aluguel
ON funcionario.idFuncionario = aluguel.idFuncionario
WHERE aluguel.idFuncionario = (SELECT MAX(idFuncionario)FROM aluguel)

/*EX 18*/
SELECT dataHoraRetirada, SUM(valorPago) AS 'Valor total maior que 100,00' FROM aluguel
WHERE valorPago > 100
GROUP BY dataHoraRetirada

/*EX 19*/
SELECT formaPagamento, SUM(valorPago) AS 'Total de cada forma de pagamento' FROM aluguel
GROUP BY formaPagamento

/*EX 20*/
SELECT nomeEquipamento, COUNT(*) AS 'Qtd alugados' FROM equipamento
JOIN aluguelequipamento
ON equipamento.idEquipamento = aluguelequipamento.idEquipamento
JOIN aluguel
ON aluguelequipamento.idAluguel = aluguel.idAluguel
GROUP BY nomeEquipamento
HAVING COUNT(*) >= 3

SELECT * FROM aluguel

/*Atividades de Views*/
/*EX 1*/
CREATE VIEW vwFuncionarioData AS
SELECT
funcionario.nomeFuncionario,
aluguel.dataHoraRetirada,
cliente.nomeCliente
FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
JOIN funcionario
ON aluguel.idFuncionario = funcionario.idFuncionario

SELECT * FROM vwFuncionarioData

/*EX 2*/
CREATE PROCEDURE pS_AlugueisDatas
(
IN dataDeRetirada DATETIME
)
SELECT
funcionario.nomeFuncionario,
aluguel.dataHoraRetirada,
cliente.nomeCliente,
equipamento.nomeEquipamento
FROM aluguel
JOIN cliente
ON aluguel.idCliente = cliente.idCliente
JOIN funcionario
ON aluguel.idFuncionario = funcionario.idFuncionario
JOIN aluguelequipamento
ON aluguel.idAluguel = aluguelequipamento.idAluguel
JOIN equipamento
ON aluguelequipamento.idEquipamento = equipamento.idEquipamento
WHERE dataHoraRetirada =  dataDeRetirada

CALL pS_AlugueisDatas ('2024-12-27')

/*EX 3*/
CREATE VIEW vwQuantidadeAlugueisPorFormaPagamento AS
SELECT
formaPagamento,
COUNT(*) AS 'Qtd de Aluguéis' FROM aluguel
GROUP BY formaPagamento

SELECT * FROM vwQuantidadeAlugueisPorFormaPagamento

/*É melhor usar o view pois é só para exibir as informções necessárias da quantidade e forma de pagamento*/

/*EX 4*/
CREATE PROCEDURE pU_reajuste_equipamentos
(
IN percentual DECIMAL(5,2)
)
UPDATE equipamento
SET valorHora = ROUND(valorHora * (1 + (percentual / 100)), 2);

SELECT
nomeEquipamento,
valorHora AS valor_reajustado
FROM equipamento;
 
 
CALL pU_reajuste_equipamentos(10);

/*EX 5*/
CREATE PROCEDURE pS_AlugueisPagamento
(
IN forma VARCHAR(100)
)
SELECT * FROM vwQuantidadeAlugueisPorFormaPagamento
WHERE vwQuantidadeAlugueisPorFormaPagamento.formaPagamento = forma;
 
CALL pS_AlugueisPagamento ('cartao');

/*Desafio*/
CREATE PROCEDURE ps_CriarAluguel
(
IN p_idCliente INT,
IN p_idFuncionario INT,
IN p_idEquipamento INT,
IN p_qtd INT,
IN p_formaPagamento VARCHAR(50)
)
 
BEGIN
 
DECLARE v_valorUnitario DECIMAL(10,2);
DECLARE v_valorTotal DECIMAL(10,2);
DECLARE v_idAluguel INT;
 
    
/* BUSCA O VALOR DO EQUIPAMENTO */
SELECT valorHora
INTO v_valorUnitario
FROM equipamento
WHERE idEquipamento = p_idEquipamento;
 
    
/* CALCULA O VALOR TOTAL */
SET v_valorTotal = v_valorUnitario * p_qtd;
 
START TRANSACTION
    
/* CRIA O ALUGUEL */
INSERT INTO aluguel
(
idCliente,
idFuncionario,
dataHoraRetirada,
valorApagar,
valorPago,
pago,
formaPagamento
)
VALUES
(
2,
1,
NOW(),
10,
0,
0,
NULL
);
 
    
/* PEGA O IDD DO ALUGUEL */
SET v_idAluguel = LAST_INSERT_ID();
 
    
/* INSERE QUAL VAI SER O EQUIPAMENTO */
INSERT INTO aluguelequipamento
(
idEquipamento,
idAluguel,
valorItem,
valorUnitario,
qtd
)
VALUES
(
1,
LAST_INSERT_ID(),
10,
10,
1
);
 
    
/* ATUALIZAA O ESTOQUE */
UPDATE equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 1;
 
END $$
 
DELIMITER ; -- DELIMITER SERVE PARA FALAR PRO SQL Q TERMNOU A PROCEUDRE $$
 
 
/*TESTAR*/
COMMIT

ROLLBACK

SELECT * FROM aluguelEquipamento
SELECT * FROM aluguel
ORDER BY idAluguel DESC;
 
 
CALL ps_CriarAluguel(6, 2, 3, 2, 'Pix');
 
CALL ps_CriarAluguel(1, 3, 3, 2, 'Dinheiro');
 
CALL ps_CriarAluguel(5, 2, 4, 3, 'Cartao');
 
CALL ps_CriarAluguel(7, 3, 2, 2, 'Dinheiro');
 
CALL ps_CriarAluguel(2, 3, 3, 2, 'Pix');
 