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
## Banco de dados Empresa
```sql

```
1. Exibir o nome, cargo e salário dos empregados que ganham mais de R$ 2000.00. Ordenar o resultado pelo cargo em ordem crescente, e em seguida, pelo nome do empregado em ordem decrescente.
```sql

```
2. Exibir o código do departamento e o nome dos empregados dos departamentos 10 e 20, que possuem o cargo de BALCONISTA. Ordenar o resultado pelo código do departamento e em seguida, pelo nome, ambos em ordem crescente.
```sql

```
3. Exibir o nome e cargo dos empregados que possuem salário entre R$ 1000,00 e R$ 5000,00. Ordenar o resultado pelo salário em ordem decrescente.
```sql

```
4. Exibir o código, nome e o salário anual dos empregados que não possuem comissão (comissão nula). Ordenar o resultado pelo salário anual. Nomear a última coluna como "Salário Anual".
```sql

```
5. Exibir o nome, a comissão e o cargo dos empregados cujo nome comece com a letra A e que termine com a letra S. Ordenar o resultado pelo cargo do empregado, e em seguida, pelo nome, ambos em ordem decrescente.
```sql

```
## Banco de dados Nutrição
```sql

```
1. Exibir o nome do paciente, sua cidade e estado, mas somente dos pacientes que possuem "Silva" no nome. Ordenar o resultado pelo nome em ordem decrescente
```sql

```
2. Exibir o nome do paciente, seu endereço, bairro, cidade e o estado, mas somente dos pacientes dos estados do Rio de Janeiro e São Paulo. Ordenar o resultado inicialmente pelo estado, e em seguida pela cidade, ambos em ordem crescente.
```sql

```
3. Exibir o nome e estado das cidades onde os pacientes moram. Não exibir resultados duplicados. Ordenar o resultado inicialmente pelo estado, e em seguida pela cidade, ambos em ordem crescente.
```sql

```
4. Exibir o nome, cidade e endereço dos pacientes do estado de Minas Gerais. Ordenar o resultado pelo nome da cidade e em seguida pelo nome da paciente, ambos em ordem crescente.
```sql

```
