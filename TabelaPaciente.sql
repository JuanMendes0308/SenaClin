information_schemasenaclinsenaclinaluguel_praiaaluguel_praiaCREATE TABLE paciente(
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
)
 
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
)
 
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
)
 
 
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