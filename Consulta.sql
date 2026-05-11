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