#Curso de Extensão – Introdução à Linguagem SQL
#Exercícios – Restringindo e Ordenando Dados
##Banco de dados dbFutebol
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

```
2. Exibir o nome e salário dos jogadores que jogam no time de código 1 (Atlético)
```sql

```
3. Exibir o nome e salário dos jogadores que possuem salário menor ou igual a R$ 200.000,00. Exibir os dados por ordem decrescente do salário
```sql

```
4. Exibir o nome e salário dos jogadores cujo nome comece com a letra I
Exibir o nome e data de nascimento dos jogadores cujo nome comece com a letra F e termine com a letra o
```sql

```

