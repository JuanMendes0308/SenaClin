CREATE TABLE paciente(
idPaciente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
celular CHAR(11) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cep CHAR(8) NOT NULL,
tipolog VARCHAR(50) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10),
cidade VARCHAR(100),
uf CHAR(2),
dataNascimento DATETIME NOT NULL,

CONSTRAINT ch_uf CHECK uf IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO')

);