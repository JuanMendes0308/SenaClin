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