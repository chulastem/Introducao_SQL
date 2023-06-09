# Curso de Extensão – Introdução à Linguagem SQL
# Exercícios – Restringindo e Ordenando Dados
## Banco de dados dbFutebol
```sql
create table posicao(
	idPosicao	int primary key 
,	nome		varchar(20) not null
);

insert into posicao(idPosicao, nome)
values(1, 'Goleiro'), (2, 'Zagueiro'), (3, 'Meio-campo'), (4, 'Atacante');

create table time(
	idTime	int primary key
,	nome	varchar(50) not null
,	estado	char(2)
);

insert into time(idTime, nome, estado)
values(1, 'Atlético', 'MG')
,	  (2, 'Cruzeiro', 'MG')	
,	  (3, 'Flamengo', 'RJ');

create table jogador(
	idJogador		int primary key
,	nome			varchar(100) not null
,	salario			numeric(10,2)
,	dataNascimento            datetime
,	idPosicao		int not null 
,	idTime			int null 
,            FOREIGN KEY(idPosicao) REFERENCES posicao(idPosicao)
,            FOREIGN KEY(idTime) REFERENCES time(idTime)
);

set dateformat dmy;

insert into jogador(idJogador, nome, salario, dataNascimento, idPosicao, idTime)
values (1, 'Everson', 150000, '01/10/1995', 1, 1)
,	   (2, 'Incrível Hulk', 850000, '12/10/1990', 4, 1)	
,	   (3, 'Fábio', 100000, '11/04/1982', 1, 2)	
,	   (4, 'Edu', 150000, '10/09/1983', 4, 2)	
,	   (5, 'Diego Tardeli', null, '03/05/1991', 4, null);

```
1. Exibir todos os dados de todos jogadores que jogam no time de código 2 (Cruzeiro)
```sql
SELECT *
FROM JOGADOR
WHERE IDTIME = '2'
```
2. Exibir o nome e salário dos jogadores que jogam no time de código 1 (Atlético)
```sql
SELECT 	NOME
,	SALARIO
FROM JOGADOR
WHERE IDTIME = '1'
```
3. Exibir o nome e salário dos jogadores que possuem salário menor ou igual a R$ 200.000,00. Exibir os dados por ordem decrescente do salário
```sql
SELECT 	NOME
,	SALARIO
FROM JOGADOR
WHERE SALARIO <= '200000'
ORDER BY SALARIO DESC
```
4. Exibir o nome e salário dos jogadores cujo nome comece com a letra I
Exibir o nome e data de nascimento dos jogadores cujo nome comece com a letra F e termine com a letra o
```sql
SELECT 	NOME 
,	SALARIO 
FROM JOGADOR 
WHERE NOME LIKE 'I%'

SELECT 	NOME 
,	DATANASCIMENTO
FROM JOGADOR 
WHERE NOME LIKE 'F%' AND NOME LIKE '%O'
```
## Banco de dados Empresa
```sql
CREATE TABLE DEPT
       (DEPTNO INT PRIMARY KEY,
        NOME VARCHAR(100),
        LOC VARCHAR(100) )

INSERT INTO DEPT VALUES 
 (10,'Tecnologia da Informação','New York')
,(20,'Pesquisa','Dallas')
,(30,'Venda','Chicago')
,(40,'Operacional','Boston')

CREATE TABLE EMP
       (EMPNO INT NOT NULL PRIMARY KEY,
        NOME VARCHAR(100),
        CARGO VARCHAR(100),
        GERENTE INT,
        DATACONTRATACAO DATETIME,
        SALARIO MONEY,
        COMISSAO MONEY,
        DEPTNO INT NULL,
        CONSTRAINT FK_DEPT FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
        CONSTRAINT FK_EMP FOREIGN KEY (GERENTE) REFERENCES EMP (EMPNO))

SET LANGUAGE ENGLISH

INSERT INTO EMP VALUES
         (7369,'Smith','Analista de negócios',7902,'17-DEC-15',3500,NULL,20)
,        (7499,'Allen','Vendedor',7698,'20-FEB-16',5050.50,300,30)
,        (7521,'Ward','Vendedor',7698,'22-FEB-15',4250.75,500,30)
,        (7566,'Jones','Contador',7839,'2-APR-20',7600,NULL,20)
,        (7654,'Martin','Vendedor',7698,'28-SEP-21',4250,1400,30)
,        (7698,'Blake','Web designer',7839,'1-MAY-20',7850,NULL,10)
,        (7782,'Clark','Analista desenvolvedor',7839,'9-JUN-19',9450,NULL,10)
,        (7788,'Scott','Analista de negócios',7566,'09-DEC-19',5000,NULL,10)
,        (7839,'King','Presidente',NULL,'17-JAN-17',25000,NULL,10)
,        (7844,'Turner','Vendedor',7698,'8-SEP-20',4500,0,30)
,        (7876,'Adams','Balconista',7788,'12-JAN-22',1100,NULL,20)
,        (7900,'James','Balconista',7698,'3-DEC-11',1950,NULL,30)
,        (7902,'Ford','Web designer',7566,'3-DEC-10',4800,NULL,10)
,        (7934,'Miller','Balconista',7782,'23-JAN-12',2300,NULL,NULL)

CREATE TABLE SALGRADE
      ( GRAU INT,
        SALMINIMO MONEY,
        SALMAXIMO MONEY)

INSERT INTO SALGRADE VALUES 
	(1,0,2000)
,	(2,2000,4000)
,	(3,4000,6000)
,	(4,6000,9000)
,	(5,9000,99999)

CREATE TABLE PARAMETRO(
	VALDESCONTO MONEY
)
INSERT INTO PARAMETRO VALUES(0.20)


```
1. Exibir o nome, cargo e salário dos empregados que ganham mais de R$ 2000.00. Ordenar o resultado pelo cargo em ordem crescente, e em seguida, pelo nome do empregado em ordem decrescente.
```sql
SELECT	NOME 
,	CARGO 
,	SALARIO 	
FROM EMP 	
WHERE SALARIO > '2000' 
ORDER BY CARGO, NOME DESC
```
2. Exibir o código do departamento e o nome dos empregados dos departamentos 10 e 20, que possuem o cargo de BALCONISTA. Ordenar o resultado pelo código do departamento e em seguida, pelo nome, ambos em ordem crescente.
```sql
SELECT	DEPTNO
,	NOME 
FROM EMP 
WHERE DEPTNO IN ('10','20')
	AND CARGO = 'BALCONISTA'
ORDER BY EMPNO, NOME     
```
3. Exibir o nome e cargo dos empregados que possuem salário entre R$ 1000,00 e R$ 5000,00. Ordenar o resultado pelo salário em ordem decrescente.
```sql
SELECT	NOME 
,	CARGO 
FROM EMP 
WHERE SALARIO BETWEEN '1000' AND '5000'
ORDER BY SALARIO DESC
```
4. Exibir o código, nome e o salário anual dos empregados que não possuem comissão (comissão nula). Ordenar o resultado pelo salário anual. Nomear a última coluna como "Salário Anual".
```sql
SELECT	EMPNO 
,	NOME 
,	SALARIO*12 AS "Salário Anual" 
FROM EMP 
WHERE COMISSAO IS NULL
ORDER BY SALARIO 
```
5. Exibir o nome, a comissão e o cargo dos empregados cujo nome comece com a letra A e que termine com a letra S. Ordenar o resultado pelo cargo do empregado, e em seguida, pelo nome, ambos em ordem decrescente.
```sql
SELECT	NOME 
,	COMISSAO 
,	CARGO 
FROM EMP 
WHERE NOME LIKE 'A%' AND NOME LIKE '%S'
ORDER BY CARGO DESC, NOME DESC
```
## Banco de dados Nutrição
```sql
create table paciente(
	idPaciente int 
		constraint pkPaciente primary key 
,	nome		varchar(100) not null
,	sexo		char not null
,	endereco	varchar(100) not null
,	bairro		varchar(100) not null
,	cidade		varchar(100) not null
,	estado		char(2) not null
,	dataNascimento	smalldatetime not null
,	dataInclusao		datetime default getdate()
)	

set dateformat dmy

INSERT INTO paciente (idPaciente, nome, sexo, endereco, bairro, cidade, estado, dataNascimento) VALUES
(100, 'João da Silva', 'M', 'Av. Amazonas, 100/101', 'Centro', 'Belo Horizonte', 'MG', '01-10-1973'),
(110, 'Maria José de Souza','F',  'Rua Curitiba, 1009/102', 'Centro', 'Belo Horizonte', 'MG', '20-11-2000'),
(120, 'Antônio Carlos Ferreira', 'M', 'Rua Piauí, 200/501', 'Funcionários', 'Belo Horizonte', 'MG', '03-11-2001'),
(130, 'Patrícia dos Santos', 'F', 'Rua Paraíba, 300/902', 'Funcionários', 'Sete Lagoas', 'MG', '15-06-1990'),
(140, 'Paulo Correia', 'M', 'Rua Platina, 400/1002', 'Prado', 'Sete Lagoas', 'MG', '01-01-1997'),
(150, 'Daniela Marinho', 'F', 'Rua Joaquim Xavier, 300/902', 'Penha', 'Rio de Janeiro', 'RJ', '01-01-1994'),
(160, 'Fabrícia Silva Passos', 'F', 'Rua Álvares Cabral, 4000/502', 'Leblon', 'Rio de Janeiro', 'RJ', '01-08-1983'),
(170, 'Danilo Passos', 'M', 'Pça. D. Pedro I, 890/104', 'Ipanema', 'Rio de Janeiro', 'RJ', '08-05-1979'),
(180, 'Roberto Assunção', 'M', 'Av. Tiradentes, 3500/105', 'Centro', 'São Paulo', 'SP', '03-04-2002'),
(190, 'Sílvia Cordeiro', 'F', 'Av. Paulista, 5500/105', 'Centro', 'São Paulo', 'SP', '10-06-2001'),
(200, 'Ricardo Andrade e Silva', 'M', 'Rua da Concórdia, 670/205', 'Centro', 'Jacareí', 'SP', '23-05-2005'),
(210, 'Flávio Siqueira de Oliveira', 'M', 'Rua Conceição, 100', 'Jardim Paulista', 'Pindamonhangaba', 'SP', '20-10-1999'),
(220, 'Michel Dias da Silva', 'M', 'Rua Honorina Barros, 450', 'Praia dos Corais', 'Caraguatatuba', 'SP', '20-07-2001'),
(230, 'Maria Veríssima dos Santos', 'F', 'Rua Geraldo da Silva Teixeira, 120', 'Havaí', 'São José dos Campos', 'SP', '01-10-2002')

create table medico(
	idMedico int 
		constraint pkMedico primary key
,	nome	varchar(100) not null
,	CRM		int not null	
,	dataInclusao datetime default getdate()
)

INSERT INTO medico (idMedico, nome, CRM) VALUES
(100, 'João Antonio de Almeida', 43253),
(110, 'Angela Marcia da Silva', 89238),
(120, 'Karine dos Santos', 89542),
(130, 'Paulo José Krush', 4553),
(140, 'Henrique Figueiredo Dias', 3213),
(150, 'Frederico Cruzeiro de Souza', 27667),
(160, 'Maria José Costa', 94328),
(170, 'Fernanda Couto', 43625),
(180, 'Artur Korth', 65748),
(190, 'Maurício de Souza Antunes', 32553),
(200, 'Angelica Hosken', 4553)

create table consulta(
	idConsulta	int identity
		constraint pkConsulta primary key
,	datConsulta		smalldatetime not null
,	idPaciente		int not null
		constraint fkConsulta1 foreign key
			references paciente
,	idMedico		int not null
		constraint fkConsulta2 foreign key
			references medico
,	dataInclusao		datetime default getdate()
)

insert into consulta(datConsulta, idPaciente, idMedico) values 
('01-06-2022 17:00:00', 100, 200),
('01-08-2022 14:30:00', 100, 200),
('11-11-2022 11:00:00', 100, 190),
('05-12-2022 16:30:00', 100, 190),
('21-07-2022 09:00:00', 110, 100),
('01-12-2022 08:30:00', 110, 150),
('03-01-2022 10:30:00', 110, 150),
('01-12-2022 16:00:00', 120, 160),
('31-01-2022 15:00:00', 120, 170),
('01-11-2022 16:00:00', 130, 130),
('31-12-2022 15:30:00', 130, 130),
('01-02-2022 17:00:00', 130, 130),
('31-01-2022 15:30:00', 140, 180),
('06-11-2022 16:00:00', 150, 160),
('27-12-2022 15:00:00', 150, 160),
('12-11-2022 10:30:00', 150, 160),
('07-10-2022 15:00:00', 160, 120),
('01-12-2023 10:30:00', 160, 120),
('01-09-2023 08:00:00', 170, 100),
('02-12-2023 10:30:00', 170, 100),
('02-10-2023 15:00:00', 210, 200),
('03-12-2023 10:30:00', 210, 200),
('03-07-2023 15:30:00', 220, 200),
('03-11-2023 08:30:00', 230, 190)

create table avaliacaoNutricional(
	idAvaliacaoNutricional int identity
		constraint pkAvaliacaoNutricional primary key
,	idConsulta		int not null	
		constraint fkAvaliacaoNutricional1 foreign key
			references consulta
,	peso			numeric(10,2)
,	altura			numeric(10,2)
,	percGordura		numeric(10,2)
,	dataInclusao		datetime default getdate()
)

insert into avaliacaoNutricional(idConsulta, peso, altura, percGordura) values 
(1, 76.5, 1.72, 10.5),
(2, 77.3, 1.72, 12.3),
(3, 81.4, 1.72, 14.6),
(4, 77.0, 1.72, 10.7),
(5, 56.5, 1.61, 11.0),
(6, 57.3, 1.61, 12.9),
(7, 51.4, 1.62, 9.0),
(8, 60.0, 1.62, 10.4),
(9, 62.9, 1.62, 13.0),
(10, 90.0, 1.82, 25.0),
(11, 95.5, 1.82, 27.0),
(12, 97.0, 1.82, 28.0),
(13, 88.5, 1.89, 27.0),
(14, 70.0, 1.72, 17.0),
(15, 67.5, 1.72, 15.0),
(16, 67.9, 1.73, 15.4),
(17, 45.1, 1.50, 6.0),
(18, 47.8, 1.50, 7.6),
(19, 85.1, 1.70, 17.0),
(20, 97.6, 1.71, 21.6),
(21, 89.1, 1.65, 26.0),
(22, 83.8, 1.65, 23.6),
(23, 89.1, 1.65, 26.0),
(24, 53.8, 1.65, 13.6)

create table categoriaDieta(
	idCategoriaDieta int identity
		constraint pkCategoriaDieta primary key
,	nome varchar(100) not null
,	dataInclusao	datetime default getdate()
)

insert into categoriaDieta (nome) values
('Emagrecimento'),
('Ganho de peso'),
('Hipertrofia muscular'),
('Colesterol LDL alto'),
('Diabetes'),
('Desintoxicação'),
('Gestação'),
('Intolerância a lactose')

create table dieta(
	idDieta	int identity
		constraint pkDieta primary key
,	idConsulta		int not null
		constraint fkDieta1 foreign key
			references consulta
,	idCategoriaDieta int not null
		constraint fkDieta2 foreign key
			references categoriaDieta
,	dataInclusao	datetime default getdate()
)

insert into dieta(idConsulta, idCategoriaDieta) values 
(1, 1),
(2, 1),
(3, 1),
(4, 3),
(5, 2),
(6, 2),
(7, 7),
(8, 5),
(9, 6),
(13, 2),
(15, 1),
(17, 1),
(18, 6),
(19, 6),
(20, 8),
(21, 8),
(22, 2),
(24, 4)

```
1. Exibir o nome do paciente, sua cidade e estado, mas somente dos pacientes que possuem "Silva" no nome. Ordenar o resultado pelo nome em ordem decrescente
```sql
SELECT	NOME 
,	CIDADE 	
,	ESTADO 		
FROM PACIENTE 
WHERE NOME LIKE '%SILVA%'
ORDER BY NOME DESC 
```
2. Exibir o nome do paciente, seu endereço, bairro, cidade e o estado, mas somente dos pacientes dos estados do Rio de Janeiro e São Paulo. Ordenar o resultado inicialmente pelo estado, e em seguida pela cidade, ambos em ordem crescente.
```sql
SELECT	NOME 
,	ENDERECO 
,	BAIRRO 
, 	CIDADE 
, 	ESTADO 
FROM PACIENTE 
WHERE ESTADO IN ('RJ','SP')
ORDER BY ESTADO, CIDADE
```
3. Exibir o nome e estado das cidades onde os pacientes moram. Não exibir resultados duplicados. Ordenar o resultado inicialmente pelo estado, e em seguida pela cidade, ambos em ordem crescente.
```sql
SELECT DISTINCT CIDADE  
,	ESTADO 
FROM PACIENTE 
ORDER BY ESTADO, CIDADE
```
4. Exibir o nome, cidade e endereço dos pacientes do estado de Minas Gerais. Ordenar o resultado pelo nome da cidade e em seguida pelo nome da paciente, ambos em ordem crescente.
```sql
SELECT	NOME
,	CIDADE 
,	ENDERECO 
FROM PACIENTE 
WHERE ESTADO = 'MG'
ORDER BY CIDADE, NOME
```
