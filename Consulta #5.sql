/* FUNCOES */

/* VALORES DO MAIRO AO MENOR */
SELECT MAX(idMedico) AS 'consulta mais cara' FROM consulta;
SELECT MIN(valor) AS 'consulta mais barata'
FROM consulta;

/* SOMA */
SELECT SUM(valor) AS 'total arrecadado das consultas'
FROM consulta
WHERE tipoConsulta = 'Primeira Consulta';


/*MEDIA*/
SELECT AVG(valor) AS 'consultas de valor arrecadados'
FROM consulta
WHERE YEAR(dataHoraConsulta)=2024;
SELECT AVG(valor) AS 'media do valor arrecadados'
FROM consulta
WHERE MONTH(dataHoraConsulta)=6;

/*CONTAR*/
SELECT COUNT(*) AS 'qtd de pacientes'
FROM paciente;
SELECT COUNT(*) AS 'qtd de pacientes - SANTOS SP'
FROM paciente
WHERE cidade = 'Santos';
SELECT ROUND(133.8888) -- AREDONDAR

/*AGREGACOES*/ 

/*QUANTOS MEDIOCS TEM POR ESPECIALIDADE*/

SELECT nomeEspecialidade, COUNT(*) AS 'qtd de medicos'
FROM medico
JOIN especialidade
ON medico.idEspecialidade = especialidade.idEspecialidade
GROUP BY nomeEspecialidade;

/*QUANTO ARRECADEI NAS CONSULTAS E REOTRNO DA PRIMERA VEZ*/

SELECT tipoConsulta SUM, (valor) AS 'valor total R$' FROM consulta 
GROUP BY tipoConsulta;

/*QUANTAS CONSULTAS NO MES DO ANO*/

SELECT MONTH(dataHoraConsulta) AS 'mes referencia',
COUNT(*) AS 'qtd consultas'
FROM consulta
WHERE YEAR (dataHoraConsulta)=2024
GROUP BY MONTH(dataHoraConsulta);

/*RELATORIOS*/

/* USO DE VIEWS E STORED PROCEDURES*/

/* RELATORIO DE CONSULTA

   NOME PACIENTE CEL EMAIL / DATA COSNULTA / NOME MEDICO / ESPECIALIDADE */

/*CRIANDO A VIEW*/

CREATE VIEW vw_RelatorioAvisoPacientes AS   
SELECT 
paciente.nome AS 'Paciente' ,
paciente.celular,
paciente.email,
consulta.dataHoraConsulta,
medico.nome AS 'Medico',
especialidade.nomeEspecialidade
FROM consulta
JOIN paciente 
ON consulta.idpaciente = paciente.idPaciente
JOIN medico 
ON medico.idmedico = consulta.idmedico
JOIN especialidade
ON especialidade.idEspecialidade = medico.idEspecialidade

/* UTILIZANDO A VIEW CRIADA*/

SELECT * FROM vw_RelatorioAvisoPacientes

/* criação de procedure */

CREATE PROCEDURE pS_RelatorioAvisoPacientePorMedico
(
IN nomemedico VARCHAR(100)
)

SELECT * FROM vw_RelatorioAvisoPacientes
WHERE medico = nomemedico
 
/* usando o procedure criada */

CALL pS_RelatorioAvisoPacientePorMedico ('Dr. Guilherme Souza');
 
/* Procedure para cadastrar especialidade */

CREATE PROCEDURE pi_especialidade
(
IN especialidadeinserida VARCHAR(100)
)
INSERT INTO especialidade (nomeespecialidade)
VALUES (especialidadeinserida);
 
CALL pi_especialidade('Oftalmologista')
CALL pi_especialidade('Pediatra')
 
SELECT * FROM especialidade

 