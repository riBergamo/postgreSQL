CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

SELECT * FROM aluno;

INSERT INTO aluno (
	nome, 
	cpf, 
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) values (
	'Riane', 
	'75684522501', 
	'Lorem ipsum enim et elit ullamcorper, eget varius odio gravida. Pellentesque id iaculis ex. Phasellus rhoncus sapien purus, a ultricies sapien lacinia id, lorem vitae tempor cursus eleifend nisi non, malesuada nisi. Praesent sed pharetra vehicula orci',
	20,
	10.50,
	1.62,
	TRUE,
	'2002-11-01',
	'11:49:20',
	'2022-11-18 11:50:40'
);

SELECT * FROM aluno WHERE id = 1;

UPDATE aluno
	SET cpf = '65987565811',
	observacao = 'Teste 1 2 3',
	idade = 30,
	dinheiro = 15.20,
	altura = 1.80,
	ativo = false
where ID=7;

DELETE FROM aluno WHERE nome = 'Riane';

select nome as nomes from aluno;

SELECT * FROM aluno WHERE nome LIKE '%i%a%';

INSERT INTO aluno (nome) VALUES  ('Vinicius Dias');
INSERT INTO aluno (nome) VALUES  ('Nico Steppat');
INSERT INTO aluno (nome) VALUES  ('João Pedro');
INSERT INTO aluno (nome) VALUES  ('Diego');
INSERT INTO aluno (nome) VALUES  ('Diogo');

SELECT * FROM aluno WHERE cpf IS NOT null;

SELECT * FROM aluno WHERE idade BETWEEN 10 AND 20;

SELECT * FROM aluno WHERE nome LIKE 'D%' AND cpf IS NOT null;

SELECT * FROM aluno WHERE nome LIKE 'D%' 
					   OR nome LIKE 'R%' 
					   OR nome LIKE 'N%';
					
CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);
					
DROP TABLE curso;

INSERT INTO curso (id, nome) VALUES (1, 'PostgreSQL');
INSERT INTO curso (id, nome) VALUES (2, 'HTML');
INSERT INTO curso (id, nome) VALUES (3, 'GIT E GITHUB');

SELECT * FROM curso;

DROP TABLE aluno;

CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id) REFERENCES aluno (id),
	FOREIGN KEY (curso_id) REFERENCES curso (id)	
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 3);

SELECT aluno.nome as "Nome do aluno", curso.nome as "Nome do curso"
		FROM aluno
		JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		JOIN curso       ON curso.id             = aluno_curso.curso_id;

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

INSERT INTO aluno (nome) VALUES ('Nico');

INSERT INTO curso (id, nome) VALUES (4, 'CSS');

SELECT aluno.nome as "Nome do aluno", curso.nome as "Nome do curso"
		FROM aluno
		LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		LEFT JOIN curso       ON curso.id             = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno", curso.nome as "Nome do curso"
		FROM aluno
		RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		RIGHT JOIN curso       ON curso.id             = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno", curso.nome as "Nome do curso"
		FROM aluno
		FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		FULL JOIN curso       ON curso.id             = aluno_curso.curso_id;
		
SELECT aluno.nome as "Nome do aluno", curso.nome as "Nome do curso"
		FROM aluno
		CROSS JOIN curso;      
		
SELECT * FROM aluno_curso;

SELECT * FROM curso;
SELECT * FROM aluno;		

INSERT INTO aluno (nome) VALUES ('João');

INSERT INTO curso (id, nome) VALUES (5, 'JAVA');

DELETE FROM aluno WHERE id = 2;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id) REFERENCES aluno (id) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY (curso_id) REFERENCES curso (id)	
);

SELECT 	aluno.id   AS aluno_id,
		aluno.nome AS "Nome do aluno", 
		curso.id   AS curso_id,
		curso.nome AS "Nome do curso"
		FROM aluno
		JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		JOIN curso       ON curso.id             = aluno_curso.curso_id;

UPDATE aluno 
	SET id = 10 WHERE id = 1;
	
--aula 6

DROP TABLE funcionarios;

CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinicius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Oliveira');

SELECT * FROM funcionarios ORDER BY 2;

SELECT * FROM funcionarios ORDER BY 4 DESC, 3 DESC, 2;
SELECT * FROM funcionarios ORDER BY sobrenome DESC, nome DESC, matricula;
SELECT * FROM funcionarios ORDER BY funcionarios.sobrenome DESC, funcionarios.nome DESC, funcionarios.matricula;

SELECT 	aluno.id   AS aluno_id,
		aluno.nome AS "Nome do aluno", 
		curso.id   AS curso_id,
		curso.nome AS "Nome do curso"
		FROM aluno
		JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		JOIN curso       ON curso.id             = aluno_curso.curso_id
		ORDER BY 2, curso.id;    
		
SELECT * FROM funcionarios LIMIT 5;
		
SELECT * 
	FROM funcionarios 
	ORDER BY id
	LIMIT 5      
	OFFSET 5;     

SELECT  COUNT(id), 
		SUM(id), 
	 	MAX(id), 
		MIN(id),
		ROUND (AVG(id), 0)
		FROM funcionarios;
		
--round arredonda(no caso para 0 casas decimais)

SELECT  COUNT(id), 
		ROUND (AVG(id), 0)
		FROM aluno;

--DISTINCT: todos os dados nao se repetirao, n aceita numeros

SELECT DISTINCT nome 
	FROM funcionarios
	ORDER BY nome;
	
--GROUP BY: permite usar COUNT, aceita numero

SELECT 
		nome, 
		sobrenome,
		COUNT(id)
	FROM funcionarios
	GROUP BY nome, sobrenome
	ORDER BY nome;
	

SELECT curso.nome, COUNT(aluno.id)
		FROM aluno 
		JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
		JOIN curso On curso.id = aluno_curso.curso_id
		GROUP BY 1
		ORDER BY 1;

--Filtrando consultas agrupadas
SELECT * FROM aluno_curso;

SELECT * FROM curso;
SELECT * FROM aluno;

SELECT  curso.nome, 
		COUNT(aluno.id) 
	FROM curso
	LEFT JOIN aluno_curso On aluno_curso.curso_id = curso.id
	LEFT JOIN aluno On aluno.id = aluno_curso.aluno_id
	GROUP BY 1
		HAVING COUNT(aluno.id) > 0;

--Não pode usar funcao de agrupamento dentro de WHERE, nesse caso se usaria HAVING

SELECT nome, COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) > 1;

		
