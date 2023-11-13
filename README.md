# GoBuzz
Testes para vaga de Analista de Dados 

Crie um Banco de Dados Simples e Realize uma Extração
O banco de dados deve ser criado em Postgres SQL e deverá incluir a configuração de tabelas e consulta final para obtenção da visualização desejada. 

Seu projeto precisa ter o seguinte:
1- Uma tabela "Users", com colunas de identificação, especialmente uma coluna de id.

2- Uma tabela "login_ips", com colunas: id, user_id, created date e  origen_ip (do tipo string). 
Obs: - As colunas id de cada tabela devem ser inteiros sequenciais, e chaves primárias.
         - A coluna user_id é uma chave estrangeira apontando para a tabela de users. 

Na prática, a tabela "login_ips" registra o IP do usuário cada vez que faz login na plataforma. Assim, cada user possui vários login_ips associados, cada um registrando o IP como string e o instante como datetime. Para simplificar, os ips são strings com um único caractere (por exemplo: "3", "a", ou "G"). 

3- Insira dados genéricos em cada tabela.

4- Dado um IP específico (por exemplo "G"), escreva uma query que liste apenas os usuários cujo último acesso foi com esse IP (origem_ip = 'G').
