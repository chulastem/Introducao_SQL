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
SELECT 	jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome As "Time"
FROM jogador
INNER JOIN time 		
	ON jogador.idtime = time.idtime
ORDER by jogador.nome

SELECT 	jogador.nome AS "Jogador"
,		jogador.salario AS "Salário"
,		time.nome As "Time"
FROM jogador
INNER JOIN time 		
	ON jogador.idtime = time.idtime
ORDER by salario DESC
```
2. Exibir o nome do jogador, a sua data de nascimento e o nome da posição em que joga. Nomear as colunas como “Jogador”, “Data de Nascimento” e “Posição”, respectivamente. Ordenar o resultado pelo nome da posição, e em seguida pela data de nascimento em ordem crescente.
```sql
SELECT 	jogador.nome AS "Nome"
,		jogador.datanascimento AS "Data de nascimento"
,		posicao.nome AS "Posição"
FROM jogador
INNER JOIN posicao 
	ON jogador.idPosicao = posicao.idPosicao
ORDER by posicao.nome

SELECT 	jogador.nome AS "Nome"
,		jogador.datanascimento AS "Data de nascimento"
,		posicao.nome AS "Posição"
FROM jogador
INNER JOIN posicao 
	ON jogador.idPosicao = posicao.idPosicao
ORDER by jogador.datanascimento

```
