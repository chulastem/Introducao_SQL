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

```
2. Exibir todos os dados dos jogadores da tabela jogador
```sql

```
3. Exibir somente o nome e estado da tabela time. Nomear a coluna estado como “Estado do Time”
```sql

```
4. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados pela data de nascimento, em ordem decrescente
```sql

```
5. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados em ordem crescente pelo salário
```sql

```
Banco de Dados dbEmpresa
```sql

```
1. Exibir todos os dados e todas as colunas da tabela EMP.
```sql

```
2. Exibir todos os dados e todas as colunas da tabela DEPT.
```sql

```
3. Exibir o nome dos empregados e o código dos departamentos onde os mesmos trabalham.
```sql

```
4. Exibir o código e nome de todos os departamentos da tabela DEPT.
```sql

```
5. Exibir o nome dos departamentos concatenados com o seu local, separados por um espaço. Nomear esta coluna como “Nome_Local”.
```sql

```
6. Exibir os códigos distintos dos departamentos onde os empregados trabalham.
```sql

```
7. Exibir o nome dos empregados, bem como o seu salário multiplicado por 12. Nomear esta última coluna como “Salário Anual”.
```sql

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
