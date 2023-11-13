-- Database: GoBuzz

--Criando o banco:
-- DROP DATABASE IF EXISTS "GoBuzz";
CREATE DATABASE "GoBuzz"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
--Criando as tabelas:
	CREATE TABLE IF NOT EXISTS users(
	id_user 	 serial,
	user_name 	 varchar(40)	NOT NULL,
	CONSTRAINT 	 "users_pkey" 	PRIMARY KEY (id_user)
);

	CREATE TABLE IF NOT EXISTS login_ips(
	id_login 	 serial,
	id_user 	 serial,
	created_date timestamp 		NOT NULL,
	ip_origin	 varchar(15)	NOT NULL,		
	CONSTRAINT "login_ips_pkey" PRIMARY KEY (id_login),
	FOREIGN KEY (id_user)
	REFERENCES users(id_user)
);

--Alimentando as tabelas:
INSERT INTO users (user_name) VALUES
('Robson Cruzoe'),
('Natalia Portman'),
('Joao Lennon'),
('Vin Gasoline'),
('Eduardo Tesoura'); 

--Fiz varias queries para que elas nao ficassem todas com o mesmo horario de entrada:
INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(3, NOW(), 'A');

INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(2,NOW(), 'B');

INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(1, NOW(), 'C');

INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(1, NOW(), 'D');

INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(5, NOW(), 'E');

INSERT INTO login_ips (id_user, created_date, ip_origin) VALUES
(5, NOW(), 'C');

--Exercicio proposto
SELECT
	user_name,
	MAX(created_date)
FROM users
	INNER JOIN login_ips 
			ON login_ips.id_user = users.id_user
WHERE ip_origin = 'C'
GROUP BY user_name;