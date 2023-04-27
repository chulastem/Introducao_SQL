# Curso de Extensão – Introdução à Linguagem SQL
# Exercícios – Selecionando Dados
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
1. Exibir todos os dados dos times da tabela time
```sql
SELECT *
FROM time
```
2. Exibir todos os dados dos jogadores da tabela jogador
```sql
SELECT *
FROM jogador
```
3. Exibir somente o nome e estado da tabela time. Nomear a coluna estado como “Estado do Time”
```sql
SELECT 	nome
,	estado
FROM time

```
4. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados pela data de nascimento, em ordem decrescente
```sql
SELECT 	nome
,	salario
,	datanascimento
FROM jogador
ORDER BY datanascimento DESC
```
5. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados em ordem crescente pelo salário
```sql
SELECT 	nome
,	salario
,	datanascimento
FROM jogador
ORDER BY salario
```
Banco de Dados dbEmpresa
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
1. Exibir todos os dados e todas as colunas da tabela EMP.
```sql
SELECT *
FROM EMP
```
2. Exibir todos os dados e todas as colunas da tabela DEPT.
```sql
SELECT *
FROM DEPT
```
3. Exibir o nome dos empregados e o código dos departamentos onde os mesmos trabalham.
```sql
SELECT 	nome AS "Funcionário"
,	deptno AS "Código do Departamento"
FROM EMP
```
4. Exibir o código e nome de todos os departamentos da tabela DEPT.
```sql
SELECT 	DEPTNO AS "Código"
,	NOME as "Nome"
FROM DEPT
```
5. Exibir o nome dos departamentos concatenados com o seu local, separados por um espaço. Nomear esta coluna como “Nome_Local”.
```sql
SELECT 	NOME + ' ' + LOC AS "Nome_Local"
FROM DEPT
```
6. Exibir os códigos distintos dos departamentos onde os empregados trabalham.
```sql
SELECT DISTINCT DEPTNO
FROM DEPT
```
7. Exibir o nome dos empregados, bem como o seu salário multiplicado por 12. Nomear esta última coluna como “Salário Anual”.
```sql
SELECT  NOME 
,	SALARIO	
,	SALARIO*12 AS "Salário Anual"
FROM EMP
```
8. Exibir o código dos empregados, bem como seu salário somado à sua comissão. Nomear esta última coluna como “Salário mais Comissão”
```sql

```
9. Exibir os cargos exclusivos a partir da tabela EMP
```sql

```
10. Exibir o nome do empregado concatenado com seu cargo, separado por uma vírgula e espaço. Nomear esta coluna como Empregado e Cargo.
```sql

```
