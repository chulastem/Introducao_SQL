# Introducao_SQL
# Exercícios – Exibindo dados de várias tabelas
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
1. Exibir o nome do jogador, o seu salário e o nome do time em que joga. Nomear as colunas como “Jogador”, “Salário” e “Time”, respectivamente. Ordenar o resultado pelo nome do time, e em seguida pelo salário em ordem decrescente.
```sql select
SELECT 		jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome As "Time"
FROM jogador
INNER JOIN time 		
	ON jogador.idtime = time.idtime
ORDER by jogador.nome

SELECT 		jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome As "Time"
FROM jogador
INNER JOIN time 		
	ON jogador.idtime = time.idtime
ORDER by salario DESC
```
2. Exibir o nome do jogador, a sua data de nascimento e o nome da posição em que joga. Nomear as colunas como “Jogador”, “Data de Nascimento” e “Posição”, respectivamente. Ordenar o resultado pelo nome da posição, e em seguida pela data de nascimento em ordem crescente.
```sql
SELECT 		jogador.nome AS "Nome"
,		jogador.datanascimento AS "Data de nascimento"
,		posicao.nome AS "Posição"
FROM jogador
INNER JOIN posicao 
	ON jogador.idPosicao = posicao.idPosicao
ORDER by posicao.nome

SELECT 		jogador.nome AS "Nome"
,		jogador.datanascimento AS "Data de nascimento"
,		posicao.nome AS "Posição"
FROM jogador
INNER JOIN posicao 
	ON jogador.idPosicao = posicao.idPosicao
ORDER by jogador.datanascimento

```
3. Exibir o nome do jogador, o seu salário, o nome do time em que joga e o nome da posição em que joga. Nomear as colunas como “Jogador”, “Salário” e “Time” e “Posição”, respectivamente. Ordenar o resultado pelo nome do time, e em seguida pelo salário, em ordem crescente.
```sql
SELECT 		jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome AS "Time"
,		posicao.nome AS	"Posição"
FROM jogador
INNER JOIN time
 	ON jogador.idTime = time.idTime
INNER JOIN posicao
  	ON jogador.idposicao = posicao.idPosicao
ORDER by time.nome

SELECT 		jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome AS "Time"
,		posicao.nome AS	"Posição"
FROM jogador
INNER JOIN time
 	ON jogador.idTime = time.idTime
INNER JOIN posicao
  	ON jogador.idposicao = posicao.idPosicao
ORDER by jogador.salario
```
4. Exibir o nome do jogador e o nome do time em que joga. Exibir todos os jogadores, mesmo os que não possuírem time. Nomear as colunas como “Jogador” e “Time”, respectivamente.
```sql
SELECT 		jogador.nome AS "Jogador"
,		time.nome AS "Time"
FROM jogador
LEFT OUTER JOIN time ON time.idtime = jogador.idTime 

```
5. Exibir o nome do time e o nome do jogador pertencente a ele. Exibir todos os times, mesmo os que não possuírem jogador. Nomear as colunas como “Time” e “Jogador”, respectivamente.
```sql
SELECT 		time.nome AS "Time"
,		jogador.nome as "Jogador"
FROM time
LEFT OUTER JOIN jogador ON time.idtime = jogador.idtime
```

## Banco de Dados dbEmpresa
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
1. Exibir o nome do empregado, o nome do departamento onde trabalha e o seu salário, mas somente dos empregados que possuem salário maior que R$ 1000,00.
```sql
SELECT 		EMP.NOME AS "Nome"
,		DEPT.nome as "Departamento"
,	   	EMP.salario as "Sálario"
from EMP
	LEFT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.salario > '1000'
```
2. Exibir o nome do empregado, o nome e local do departamento onde trabalha. Exibir todos os departamentos, mesmo os que não possuem empregado.
```sql
SELECT 		EMP.NOME AS "Nome"
,		DEPT.nome +' - '+DEPT.LOC AS "Departamento e local"
from EMP
LEFT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO

```
3. Exibir o nome do empregado, seu salário, e o nível de acordo com o seu salário (tabela SALGRADE).
```sql
SELECT 		EMP.NOME AS "Funcionário"
,		EMP.SALARIO as "Salário"
,		SALGRADE.grau AS "Grau - Salário"
FROM EMP
INNER JOIN SALGRADE 
	ON (EMP.SALARIO >= SALGRADE.SALMINIMO) AND (EMP.SALARIO <= SALGRADE.SALMAXIMO)
```
4. Exibir o nome do empregado, seu salário, bem como o nome e salário do seu gerente. Exibir todos os empregados, mesmo os que não possuem gerente.
```sql

```

