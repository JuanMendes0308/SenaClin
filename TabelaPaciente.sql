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
cidade VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
dataNascimento DATETIME NOT NULL,

CONSTRAINT ch_uf CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
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
CONSTRAINT fk_medicoEspecialidade FOREIGN KEY (idEspecialidade)
REFERENCES especialidade (IdEspecialidade) 
);

CREATE TABLE contatoMedico(
idContatoMedico INT PRIMARY KEY AUTO_INCREMENT,
idMedico INT NOT NULL,
tipoContato VARCHAR(50),
contato VARCHAR(100),
CONSTRAINT ch_tipoContato CHECK (tipoContato IN ('e-mail', 'cel', 'tel'))
);

CREATE TABLE recepcionista(
idRecepcionista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
telefone CHAR(10),
celular CHAR(11) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10),
cep CHAR(8) NOT NULL,
tipolog VARCHAR(50) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
login VARCHAR(100) NOT NULL,
senha VARCHAR(255)
);

CREATE TABLE exame(
idExame INT PRIMARY KEY AUTO_INCREMENT,
tipoExame VARCHAR(100) NOT NULL,
idConsulta INT NOT NULL,
valor DECIMAL(10,2),
dataHoraExame DATETIME NOT NULL,
resultado VARCHAR(255),
dataResultado DATETIME,
dataRetirada DATETIME,
responsavelRetirada VARCHAR(100)
);

CREATE TABLE consulta (
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepecionista INT NOT NULL, 
tipoConsulta VARCHAR(150),
valor DECIMAL(10,2),
dataHoraConsulta DATETIME,
Obeservacao VARCHAR(255),
prescricao VARCHAR(255),
temPlano BIT NOT NULL
);

CREATE TABLE exameFormaPagamento (
idExameFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idExame INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
qtdVezes INT
);

CREATE TABLE formaPagamento (
idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
nomeFormaPagamento VARCHAR(100)
);

CREATE TABLE consultaFormaPagamento(
idConsultaFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idFormaPagamento INT NOT NULL,
valor DECIMAL(10,2) NOT NULL,
qtdVezes INT
);

CREATE TABLE consultaPlano (
idConsulta INT PRIMARY KEY,
idPlanoSaude INT NOT NULL
);

CREATE TABLE planoSaude(
idPlanoSaude INT PRIMARY KEY AUTO_INCREMENT,
nomePlanoSaude VARCHAR(100) NOT NULL
);

CREATE TABLE categoriaPlano (
idCategoriaPlano INT PRIMARY KEY AUTO_INCREMENT,
idPlanoSaude INT NOT NULL,
nomeCategoriaPlano VARCHAR(100) NOT NULL
);