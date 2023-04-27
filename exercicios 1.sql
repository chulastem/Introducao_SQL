
'1. Exibir todos os dados dos times da tabela time'

SELECT *
FROM time

'2. Exibir todos os dados dos jogadores da tabela jogador'

SELECT *
FROM jogador

'3. Exibir somente o nome e estado da tabela time. Nomear a coluna estado como “Estado do Time'

SELECT 	nome
,	estado
FROM time

'4. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados pela data de nascimento, em ordem decrescente'

SELECT 	nome
,	salario
,	datanascimento
FROM jogador
ORDER BY datanascimento DESC

'5. Exibir o nome, salário e data de nascimento de todos os jogadores, ordenados em ordem crescente pelo salário'

SELECT 	nome
,	salario
,	datanascimento
FROM jogador
ORDER BY salario

'1. Exibir todos os dados e todas as colunas da tabela EMP.'

SELECT *
FROM EMP

'2. Exibir todos os dados e todas as colunas da tabela DEPT.'

SELECT *
FROM DEPT

'3. Exibir o nome dos empregados e o código dos departamentos onde os mesmos trabalham.'

SELECT 	nome AS "Funcionário"
,	deptno AS "Código do Departamento"
FROM EMP

'4. Exibir o código e nome de todos os departamentos da tabela DEPT.'

SELECT 	DEPTNO AS "Código"
,	NOME as "Nome"
FROM DEPT

'5. Exibir o nome dos departamentos concatenados com o seu local, separados por um espaço. Nomear esta coluna como “Nome_Local”.'

SELECT 	NOME + ' ' + LOC AS "Nome_Local"
FROM DEPT

'6. Exibir os códigos distintos dos departamentos onde os empregados trabalham.'

SELECT DISTINCT DEPTNO
FROM DEPT

'7. Exibir o nome dos empregados, bem como o seu salário multiplicado por 12. Nomear esta última coluna como “Salário Anual”.'

SELECT  NOME 
,	SALARIO	
,	SALARIO*12 AS "Salário Anual"
FROM EMP

'8. Exibir o código dos empregados, bem como seu salário somado à sua comissão. Nomear esta última coluna como “Salário mais Comissão”'

SELECT 	EMPNO
,	NOME
,	SALARIO
,	SALARIO+COMISSAO AS "Salário + comissão"
FROM EMP

'9. Exibir os cargos exclusivos a partir da tabela EMP'

SELECT DISTINCT	CARGO
FROM EMP

'10. Exibir o nome do empregado concatenado com seu cargo, separado por uma vírgula e espaço. Nomear esta coluna como Empregado e Cargo.'

SELECT NOME + ', ' + CARGO AS "Empregado e Cargo"
FROM EMP

