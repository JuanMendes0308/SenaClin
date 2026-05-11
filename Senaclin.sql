CREATE TABLE paciente(
idPaciente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL, 
email VARCHAR(100) NOT NULL,
celular CHAR(11) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cep CHAR(8) NOT NULL,
tipoLog VARCHAR(50) NOT NULL,
logradouro VARCHAR(100) NOT NULL, 
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10),
cidade VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
dataNascimento DATETIME NOT NULL,  
CONSTRAINT ch_uf CHECK (uf IN ('AC', 'AL', 'AP', 
'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 
'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 
'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
);
 
CREATE TABLE especialidade (
idEspecialidade INT PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(100) NOT NULL 
);
 
CREATE TABLE medico (
idMedico INT AUTO_INCREMENT,
idEspecialidade INT NOT NULL,
nome VARCHAR(100) NOT NULL, 
crm VARCHAR(6) NOT NULL UNIQUE,
CONSTRAINT pk_medico PRIMARY KEY (idMedico),
CONSTRAINT fk_medicoEspecialidade FOREIGN KEY 
(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
 
CREATE TABLE contatoMedico(
idContatoMedico INT PRIMARY KEY AUTO_INCREMENT,
idMedico INT NOT NULL, 
tipoContato VARCHAR(50),
contato VARCHAR(100),
CONSTRAINT ch_tipoContato CHECK (tipoContato IN 
('e-mail','cel','tel')),
CONSTRAINT fk_contatoMedicoMedico FOREIGN KEY 
(idMedico) REFERENCES medico(idMedico)
);
CREATE TABLE Recepcionista (
idRecepcionista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(20),
celular VARCHAR(20) NOT NULL,
cep CHAR(8) NOT NULL,
tipoLog VARCHAR(50) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
complemento VARCHAR(50),
cidade VARCHAR(50) NOT NULL,
uf CHAR(2) NOT NULL,
login VARCHAR(100) NOT NULL UNIQUE, 
senha VARCHAR(255) NOT NULL,
CONSTRAINT ch_uf CHECK (uf IN ('AC', 'AL', 'AP', 
'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 
'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 
'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
);
 
CREATE TABLE consulta (
  idconsulta INT PRIMARY KEY AUTO_INCREMENT, 
  idmedico INT NOT NULL,
  idrecepcionista INT NOT NULL,
  idpaciente INT NOT NULL,
  dataHoraConsulta DATETIME NOT NULL,
  observacao VARCHAR(255) DEFAULT NULL,
  prescricao VARCHAR(255) DEFAULT NULL,
  tipoConsulta VARCHAR(100) NOT NULL,
  temPlano TINYINT DEFAULT 1,
  valor DECIMAL(10,2),
  CONSTRAINT fk_consultaRecepcionista 
  FOREIGN KEY (idRecepcionista)
  REFERENCES Recepcionista(idRecepcionista),
  CONSTRAINT fk_consultaPaciente 
  FOREIGN KEY (idPaciente)
  REFERENCES Paciente(idPaciente),
  CONSTRAINT fk_consultaMedico
  FOREIGN KEY (idMedico)
  REFERENCES Medico(idMedico)
);
 
CREATE TABLE planoSaude(
idPlanoSaude INT PRIMARY KEY AUTO_INCREMENT,
nomePlanoSaude VARCHAR(100) NOT NULL
);
 
CREATE TABLE consultaplano  (
idconsultaPlano INT PRIMARY KEY AUTO_INCREMENT,
idconsulta INT NOT NULL,
idPlanoSaude INT NOT NULL,
CONSTRAINT fk_ConsultaPlano_Consulta FOREIGN KEY 
(idconsulta) REFERENCES consulta(idconsulta),
CONSTRAINT fk_ConsultaPlano_PlanoSaude FOREIGN KEY 
(idPlanoSaude) REFERENCES planosaude(idPlanoSaude)
);
 
CREATE TABLE categoriaPlano(
idCategoriaPlano INT PRIMARY KEY AUTO_INCREMENT,
idPlanoSaude INT NOT NULL,
nomeCategoriaPlano VARCHAR(100) NOT NULL,
FOREIGN KEY (idPlanoSaude) 
REFERENCES PlanoSaude(idPlanoSaude) #chamando outra tabela (REFERENCIA)
);
 
CREATE TABLE formaPagamento (
idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
nomeFormaPagamento VARCHAR(100) NOT NULL
);
 
CREATE TABLE ConsultaFormaPagamento (
idConsultaFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
qtdVezes INT,
CONSTRAINT fk_ConsultaFormaPagamento_Consulta 
FOREIGN KEY (idConsulta) REFERENCES consulta(idconsulta),
CONSTRAINT fk_ConsultaFormaPagamento_FormaPagamento 
FOREIGN KEY (idFormaPagamento) 
REFERENCES formapagamento(idFormaPagamento)
);
 
CREATE TABLE exame (
idExame INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL, 
tipoExame VARCHAR(100) NOT NULL,
valor DECIMAL (10,2),
dataHoraExame DATETIME NOT NULL,
resultado TEXT,
dataResultado DATETIME,
dataRetirada DATETIME, 
CONSTRAINT fk_exame_consulta 
FOREIGN KEY (idConsulta) 
REFERENCES consulta(idconsulta)
);
 
 
CREATE TABLE ExameFormaPagamento ( 
idExameFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idExame INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
qtdVezes INT NOT NULL,
FOREIGN KEY (idExame) 
REFERENCES Exame(idExame), 
FOREIGN KEY (idFormaPagamento) 
REFERENCES FormaPagamento(idFormaPagamento)
);
 
SHOW TABLES

INSERT INTO especialidade
(nomeEspecialidade)
VALUES
('Dermatologista'),
('Cardiologista'),
('Oftalmologista'),
('Clínico Geral'),
('Pediatria');

/*---*/

INSERT INTO planosaude (nomePlanoSaude)
VALUES ('Amil'), ('Unimed'), ('BlueMed'), 
('Trasmontano'), ('Hapvida');
/*---*/

INSERT INTO medico (nome, idEspecialidade, crm)
VALUES 
('Dr. Henry Alencar', 1, '834567-SP'),
('Dr. Guilherme Souza', 2, '234567-SP'),
('Dr. Arley Mendes', 3, '345678-SP'),
('Dra. Aghata Lima', 4, '456789-SP'),
('Dr. Anderson Alves', 5, '567890-SP');

/*---*/

INSERT INTO Recepcionista (
    nome, 
    telefone, 
    celular, 
    cep, 
    tipoLog, 
    logradouro, 
    numero, 
    complemento, 
    cidade, 
    uf

) VALUES (
    'Mariana', 
    '1348028922', 
    '13988557714', 
    '11010000', 
    'Avenida', 
    'Ana Costa', 
    '408', 
    'Sala 42', 
    'Santos', 
    'SP'
    );

/*---*/

INSERT INTO contatomedico 
(idmedico, tipocontato, contato)
VALUES
(1,'e-mail','henryalencar@uol.com.br'),
(1,'cel','13999887766'),
(2,'cel','13999887722'),
(3,'cel','13999887733'),
(4,'cel','13978887766'),
(5,'cel','11988887702'),
(5,'tel','1133270127'),
(5,'e-mail','andersonalvessaude@gmail.com');

/*--consultas--*/

INSERT INTO consulta (idmedico ,idrecepcionista, idpaciente ,
dataHoraConsulta,observacao,prescricao,tipoConsulta ,temPlano,valor)
values
(4,1,1,'2026-05-04 18:30','Paciente relata dores','','Primeira vez',0,50.00),
(2,1,3,'2026-05-19 10:30','','','Primeira vez',0,150.00)
 
INSERT INTO consulta ( idPaciente, idMedico, idRecepcionista, tipoConsulta, valor, dataHoraConsulta, observacao, prescricao, temPlano)
VALUES (2, 3, 1, 'Primeira vez ', 200.00, '2026-04-30 15:02', 'Vista está ruim' , NULL, 1 )
 
INSERT INTO consulta (idmedico, idrecepcionista,idpaciente, 
    dataHoraConsulta,observacao,prescricao, 
    tipoConsulta,temPlano,valor) 

VALUES (1,1,1,'2024-06-15 14:30:',   
    'Paciente com dores nas costas', 
    'Repouso e analgésico',  -- prescricao
    'Retorno',    -- tipoConsulta

    1,     -- tem Plano (1 p/ Sim, 0 p/ Não)
    450.00                   -- valor

);

INSERT INTO consulta 
(idPaciente, idMedico, idRecepcionista, tipoConsulta, valor, dataHoraConsulta, 
observacao, prescricao, temPlano)
VALUES 
(1, 2, 1, 'Primeira vez', 200.00, '2026-05-10 10:00', 'Dor no peito', NULL, 1);
 
SELECT * FROM medico

SELECT * FROM especialidade

SELECT * FROM recepcionista

SELECT * FROM planosaude

SELECT * FROM paciente

SELECT * FROM consulta
 
SELECT paciente.nome,datahoraConsulta, recepcionista.nome,
       medico.nome, nomeEspecialidade

FROM paciente INNER JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente

INNER JOIN recepcionista
ON consulta.idrecepcionista = recepcionista.idRecepcionista

INNER JOIN medico
ON consulta.idmedico = medico.idMedico 

INNER JOIN especialidade
ON especialidade.idespecialidade = medico.idespecialidade

 
-- T1
SELECT nome, nomeEspecialidade FROM medico
JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
WHERE nome LIKE '____G%'
 
SELECT * FROM medico;
 
-- T2
 
SELECT 
medico.nome,
especialidade.nomeEspecialidade,
contatomedico.tipocontato,
contatomedico.contato
FROM medico 
INNER JOIN especialidade 
ON especialidade.idEspecialidade = medico.idEspecialidade
INNER JOIN contatomedico 
ON contatomedico.idMedico = medico.idMedico;
 
-- T3
 
SELECT 
consulta.dataHoraConsulta,
paciente.nome,
especialidade.nomeEspecialidade
FROM consulta 
INNER JOIN paciente 
ON paciente.idPaciente = consulta.idPaciente
INNER JOIN medico 
ON medico.idMedico = consulta.idMedico
INNER JOIN especialidade 
ON especialidade.idEspecialidade = medico.idEspecialidade
ORDER BY consulta.dataHoraConsulta DESC;
 
-- T4
 
SELECT * FROM especialidade;
 
INSERT INTO medico (nome, idEspecialidade, crm)
VALUES ('Dr. Otávio Meirelles', 4, '999999-SP');
 
SELECT 
medico.nome,
consulta.dataHoraConsulta
FROM medico 
LEFT JOIN consulta 
ON medico.idMedico = consulta.idMedico;
 
-- T5
 
SELECT 
medico.nome,
especialidade.nomeEspecialidade,
contatomedico.contato
FROM medico 
INNER JOIN especialidade 
ON especialidade.idEspecialidade = medico.idEspecialidade
INNER JOIN contatomedico 
ON contatomedico.idMedico = medico.idMedico
WHERE contatomedico.tipocontato = 'tel'OR contatomedico.tipoContato = 'cel';

/*Funções*/
/*Valores Maior e Menor*/
SELECT MAX(valor) AS 'Consulta mais cara' FROM consulta
SELECT MIN(valor) AS 'Consulta mais barata' FROM consulta
/*Soma*/
SELECT SUM(valor) AS 'Total arrecadado nas consultas' FROM consulta
WHERE tipoConsulta = 'Primeira vez'
/*Média*/
SELECT AVG(valor) AS 'Média de valor arrecadado em consultas' FROM consulta
WHERE YEAR(dataHoraConsulta)=2026

SELECT AVG(valor) AS 'Média de valor arrecadado em consultas' FROM consulta
WHERE MONTH(dataHoraConsulta)=5

SELECT DAY('2026-05-19')

SELECT HOUR('2026-05-19 22:30:00')

SELECT MINUTE('2026-05-19 22:30:00')

SELECT SECOND('2026-05-19 22:30:10')

/*Contagem*/
SELECT COUNT(*) AS 'Qtd Pacientes' FROM paciente
SELECT COUNT(*) AS 'Qtd Pacientes - Santos SP' FROM paciente
WHERE cidade='Santos'

/*Agregando Funções*/
/*Quantos médicos tenho por cada especialidade*/
SELECT nomeEspecialidade, COUNT(*) AS 'Qtd Médicos' FROM medico
JOIN especialidade
ON medico.idEspecialidade = especialidade.idEspecialidade
GROUP BY nomeEspecialidade

/*Quanto arrecadou nas consultas retorno e primeira vez*/
SELECT tipoConsulta, SUM(valor) AS 'Total arrecadado' FROM consulta
GROUP BY tipoConsulta

/*Quantas consultas tive em cada mês de 2026*/
SELECT MONTH(dataHoraConsulta) AS 'Mês', 
		COUNT(*) AS 'Qtd Consultas' FROM consulta
WHERE YEAR(dataHoraConsulta)=2026
GROUP BY MONTH(dataHoraConsulta)

SELECT * FROM consulta

/*Filtrando Funções*/
SELECT nomeEspecialidade, COUNT(*) AS 'Qtd Médicos' FROM medico
JOIN especialidade
ON medico.idEspecialidade = especialidade.idEspecialidade
GROUP BY nomeEspecialidade
HAVING COUNT(*)>=2
/*Having é igual ao where, porém o where é só para puxar dado que tem em alguma tabela, já o having é para os que não estão em nenhuma tabela*/

/*Ordem Padrão:
where
group by
having
order by
*/

/*Quantidade de consultas feitas com e sem plano de saúde*/
SELECT temPlano, COUNT(*) AS 'Qtd de consultas' FROM consulta
GROUP BY temPlano

/*Quantidade de consultas realizadas por cada especialidade*/
SELECT medico.nome, nomeEspecialidade, COUNT(*) AS 'Qtd Consultas' FROM especialidade
JOIN medico
ON especialidade.idEspecialidade = medico.idEspecialidade
JOIN consulta
ON medico.idMedico = consulta.idMedico
GROUP BY medico.nome

/*Quantidade de consultas por paciente, mas trazer apenas os pacientes que passaram pela clínica mais de uma vez*/
SELECT paciente.nome, COUNT(*) AS 'Qtd de vezes que passou' FROM consulta 
JOIN paciente
ON consulta.idPaciente = paciente.idPaciente
GROUP BY paciente.nome
HAVING COUNT(*)>=2

SELECT * FROM consulta

