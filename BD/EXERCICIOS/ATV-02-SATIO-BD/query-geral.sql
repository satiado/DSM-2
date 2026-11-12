-- ATIVIDADE PRÁTICA | DSM2 | SISTEMA DE EXAMES LABORATORIAIS
-- MySQL 8.0+ | Dados integralmente fictícios; não são registros médicos reais.
-- ATENÇÃO: o script APAGA E RECRIA o banco pratica_laboratorio_dsm2.
-- Execute o arquivo completo no MySQL Workbench e, em seguida, elabore seus SELECTs.
DROP DATABASE IF EXISTS pratica_laboratorio_dsm2;
CREATE DATABASE pratica_laboratorio_dsm2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pratica_laboratorio_dsm2;

CREATE TABLE unidade (id_unidade INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, cidade VARCHAR(65) NOT NULL) ENGINE=InnoDB;

CREATE TABLE convenio (id_convenio INT PRIMARY KEY, nome VARCHAR(90) NOT NULL UNIQUE, tipo VARCHAR(20) NOT NULL) ENGINE=InnoDB;

CREATE TABLE paciente (id_paciente INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, cidade VARCHAR(65) NOT NULL) ENGINE=InnoDB;

CREATE TABLE profissional (id_profissional INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, especialidade VARCHAR(65) NOT NULL) ENGINE=InnoDB;

CREATE TABLE exame (id_exame INT PRIMARY KEY, nome VARCHAR(110) NOT NULL, categoria VARCHAR(45) NOT NULL, preco_tabela DECIMAL(10,2) NOT NULL, prazo_dias INT NOT NULL, CONSTRAINT chk_preco_exame CHECK (preco_tabela > 0), CONSTRAINT chk_prazo CHECK (prazo_dias >= 0)) ENGINE=InnoDB;

CREATE TABLE atendimento (id_atendimento INT PRIMARY KEY, id_paciente INT NOT NULL, id_unidade INT NOT NULL, id_convenio INT NOT NULL, id_profissional INT NOT NULL, data_atendimento DATE NOT NULL, numero_protocolo VARCHAR(24) NOT NULL UNIQUE, FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente), FOREIGN KEY (id_unidade) REFERENCES unidade(id_unidade), FOREIGN KEY (id_convenio) REFERENCES convenio(id_convenio), FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)) ENGINE=InnoDB;

CREATE TABLE solicitacao (id_solicitacao INT PRIMARY KEY, id_atendimento INT NOT NULL, id_exame INT NOT NULL, status VARCHAR(12) NOT NULL, valor_praticado DECIMAL(10,2) NOT NULL, data_coleta DATE NOT NULL, CONSTRAINT chk_status_solicitacao CHECK (status IN ('CONCLUIDO','PENDENTE','CANCELADO')), CONSTRAINT chk_valor_praticado CHECK (valor_praticado > 0), FOREIGN KEY (id_atendimento) REFERENCES atendimento(id_atendimento), FOREIGN KEY (id_exame) REFERENCES exame(id_exame)) ENGINE=InnoDB;

CREATE TABLE resultado (id_resultado INT PRIMARY KEY, id_solicitacao INT NOT NULL UNIQUE, data_liberacao DATE NOT NULL, situacao VARCHAR(20) NOT NULL, FOREIGN KEY (id_solicitacao) REFERENCES solicitacao(id_solicitacao)) ENGINE=InnoDB;


-- As solicitações concluídas são faturáveis; pendentes e canceladas NÃO entram no faturamento.
-- O valor histórico é solicitacao.valor_praticado, e não exame.preco_tabela.
-- Os resultados são dados de fluxo de trabalho, sem laudos clínicos nem informações sensíveis.


-- unidade: 4 registros

INSERT INTO unidade (id_unidade, nome, cidade) VALUES
  (1, 'Laboratório Centro', 'Registro'),
  (2, 'Laboratório Norte', 'Jacupiranga'),
  (3, 'Laboratório Sul', 'Cajati'),
  (4, 'Laboratório Ribeira', 'Eldorado');


-- convenio: 4 registros

INSERT INTO convenio (id_convenio, nome, tipo) VALUES
  (1, 'Particular', 'PARTICULAR'),
  (2, 'Vida Saúde', 'CONVENIO'),
  (3, 'Bem-Estar', 'CONVENIO'),
  (4, 'Saúde Integral', 'CONVENIO');


-- paciente: 20 registros

INSERT INTO paciente (id_paciente, nome, cidade) VALUES
  (1, 'Ana Lopes', 'Registro'),
  (2, 'Bruno Silva', 'Cajati'),
  (3, 'Carla Mendes', 'Jacupiranga'),
  (4, 'Daniel Rocha', 'Registro'),
  (5, 'Elisa Almeida', 'Sete Barras'),
  (6, 'Fabio Santos', 'Cajati'),
  (7, 'Gabriela Costa', 'Eldorado'),
  (8, 'Henrique Lima', 'Registro'),
  (9, 'Isabela Martins', 'Miracatu'),
  (10, 'João Pereira', 'Jacupiranga'),
  (11, 'Karen Souza', 'Cajati'),
  (12, 'Lucas Ribeiro', 'Eldorado'),
  (13, 'Marina Oliveira', 'Registro'),
  (14, 'Nicolas Castro', 'Miracatu'),
  (15, 'Olivia Barros', 'Sete Barras');

INSERT INTO paciente (id_paciente, nome, cidade) VALUES
  (16, 'Pedro Fernandes', 'Registro'),
  (17, 'Renata Carvalho', 'Cajati'),
  (18, 'Sofia Dias', 'Eldorado'),
  (19, 'Tiago Moraes', 'Registro'),
  (20, 'Vera Nunes', 'Jacupiranga');


-- profissional: 6 registros

INSERT INTO profissional (id_profissional, nome, especialidade) VALUES
  (1, 'Dra. Clara Reis', 'Clínica médica'),
  (2, 'Dr. Paulo Azevedo', 'Endocrinologia'),
  (3, 'Dra. Livia Torres', 'Cardiologia'),
  (4, 'Dr. Renato Pires', 'Clínica médica'),
  (5, 'Dra. Teresa Neri', 'Hematologia'),
  (6, 'Dr. André Gomes', 'Medicina de família');


-- exame: 11 registros

INSERT INTO exame (id_exame, nome, categoria, preco_tabela, prazo_dias) VALUES
  (1, 'Hemograma completo', 'HEMATOLOGIA', 55, 2),
  (2, 'Glicemia de jejum', 'BIOQUIMICA', 32, 1),
  (3, 'Colesterol total', 'BIOQUIMICA', 45, 2),
  (4, 'Triglicerídeos', 'BIOQUIMICA', 48, 2),
  (5, 'TSH', 'HORMONIOS', 92, 3),
  (6, 'T4 livre', 'HORMONIOS', 87, 3),
  (7, 'Creatinina', 'BIOQUIMICA', 38, 1),
  (8, 'Vitamina D', 'HORMONIOS', 135, 5),
  (9, 'PCR', 'IMUNOLOGIA', 75, 2),
  (10, 'Ferritina', 'HEMATOLOGIA', 110, 4),
  (11, 'Cultura bacteriana', 'MICROBIOLOGIA', 155, 6);


-- atendimento: 68 registros

INSERT INTO atendimento (id_atendimento, id_paciente, id_unidade, id_convenio, id_profissional, data_atendimento, numero_protocolo) VALUES
  (1, 8, 4, 4, 2, '2026-08-04', 'LAB-2026-0001'),
  (2, 15, 3, 3, 3, '2026-08-07', 'LAB-2026-0002'),
  (3, 4, 2, 2, 4, '2026-08-10', 'LAB-2026-0003'),
  (4, 11, 1, 1, 5, '2026-08-14', 'LAB-2026-0004'),
  (5, 18, 1, 1, 6, '2026-08-17', 'LAB-2026-0005'),
  (6, 7, 4, 4, 1, '2026-08-20', 'LAB-2026-0006'),
  (7, 14, 3, 3, 2, '2026-08-23', 'LAB-2026-0007'),
  (8, 3, 2, 2, 3, '2026-08-27', 'LAB-2026-0008'),
  (9, 10, 1, 1, 4, '2026-08-30', 'LAB-2026-0009'),
  (10, 17, 1, 1, 5, '2026-09-02', 'LAB-2026-0010'),
  (11, 6, 4, 4, 6, '2026-09-05', 'LAB-2026-0011'),
  (12, 13, 3, 3, 1, '2026-09-09', 'LAB-2026-0012'),
  (13, 2, 2, 2, 2, '2026-09-12', 'LAB-2026-0013'),
  (14, 9, 1, 1, 3, '2026-09-15', 'LAB-2026-0014'),
  (15, 16, 1, 1, 4, '2026-09-18', 'LAB-2026-0015');

INSERT INTO atendimento (id_atendimento, id_paciente, id_unidade, id_convenio, id_profissional, data_atendimento, numero_protocolo) VALUES
  (16, 5, 4, 4, 5, '2026-09-22', 'LAB-2026-0016'),
  (17, 12, 3, 3, 6, '2026-09-25', 'LAB-2026-0017'),
  (18, 1, 2, 2, 1, '2026-09-28', 'LAB-2026-0018'),
  (19, 8, 1, 1, 2, '2026-10-01', 'LAB-2026-0019'),
  (20, 15, 1, 1, 3, '2026-10-05', 'LAB-2026-0020'),
  (21, 4, 4, 4, 4, '2026-10-08', 'LAB-2026-0021'),
  (22, 11, 3, 3, 5, '2026-10-11', 'LAB-2026-0022'),
  (23, 18, 2, 2, 6, '2026-10-14', 'LAB-2026-0023'),
  (24, 7, 1, 1, 1, '2026-10-18', 'LAB-2026-0024'),
  (25, 14, 1, 1, 2, '2026-10-21', 'LAB-2026-0025'),
  (26, 3, 4, 4, 3, '2026-10-24', 'LAB-2026-0026'),
  (27, 10, 3, 3, 4, '2026-10-27', 'LAB-2026-0027'),
  (28, 17, 2, 2, 5, '2026-10-31', 'LAB-2026-0028'),
  (29, 6, 1, 1, 6, '2026-08-03', 'LAB-2026-0029'),
  (30, 13, 1, 1, 1, '2026-08-06', 'LAB-2026-0030');

INSERT INTO atendimento (id_atendimento, id_paciente, id_unidade, id_convenio, id_profissional, data_atendimento, numero_protocolo) VALUES
  (31, 2, 4, 4, 2, '2026-08-09', 'LAB-2026-0031'),
  (32, 9, 3, 3, 3, '2026-08-13', 'LAB-2026-0032'),
  (33, 16, 2, 2, 4, '2026-08-16', 'LAB-2026-0033'),
  (34, 5, 1, 1, 5, '2026-08-19', 'LAB-2026-0034'),
  (35, 12, 1, 1, 6, '2026-08-22', 'LAB-2026-0035'),
  (36, 1, 4, 4, 1, '2026-08-26', 'LAB-2026-0036'),
  (37, 8, 3, 3, 2, '2026-08-29', 'LAB-2026-0037'),
  (38, 15, 2, 2, 3, '2026-09-01', 'LAB-2026-0038'),
  (39, 4, 1, 1, 4, '2026-09-04', 'LAB-2026-0039'),
  (40, 11, 1, 1, 5, '2026-09-08', 'LAB-2026-0040'),
  (41, 18, 4, 4, 6, '2026-09-11', 'LAB-2026-0041'),
  (42, 7, 3, 3, 1, '2026-09-14', 'LAB-2026-0042'),
  (43, 14, 2, 2, 2, '2026-09-17', 'LAB-2026-0043'),
  (44, 3, 1, 1, 3, '2026-09-21', 'LAB-2026-0044'),
  (45, 10, 1, 1, 4, '2026-09-24', 'LAB-2026-0045');

INSERT INTO atendimento (id_atendimento, id_paciente, id_unidade, id_convenio, id_profissional, data_atendimento, numero_protocolo) VALUES
  (46, 17, 4, 4, 5, '2026-09-27', 'LAB-2026-0046'),
  (47, 6, 3, 3, 6, '2026-09-30', 'LAB-2026-0047'),
  (48, 13, 2, 2, 1, '2026-10-04', 'LAB-2026-0048'),
  (49, 2, 1, 1, 2, '2026-10-07', 'LAB-2026-0049'),
  (50, 9, 1, 1, 3, '2026-10-10', 'LAB-2026-0050'),
  (51, 16, 4, 4, 4, '2026-10-13', 'LAB-2026-0051'),
  (52, 5, 3, 3, 5, '2026-10-17', 'LAB-2026-0052'),
  (53, 12, 2, 2, 6, '2026-10-20', 'LAB-2026-0053'),
  (54, 1, 1, 1, 1, '2026-10-23', 'LAB-2026-0054'),
  (55, 8, 1, 1, 2, '2026-10-26', 'LAB-2026-0055'),
  (56, 15, 4, 4, 3, '2026-10-30', 'LAB-2026-0056'),
  (57, 4, 3, 3, 4, '2026-08-02', 'LAB-2026-0057'),
  (58, 11, 2, 2, 5, '2026-08-05', 'LAB-2026-0058'),
  (59, 18, 1, 1, 6, '2026-08-08', 'LAB-2026-0059'),
  (60, 7, 1, 1, 1, '2026-08-12', 'LAB-2026-0060');

INSERT INTO atendimento (id_atendimento, id_paciente, id_unidade, id_convenio, id_profissional, data_atendimento, numero_protocolo) VALUES
  (61, 14, 4, 4, 2, '2026-08-15', 'LAB-2026-0061'),
  (62, 3, 3, 3, 3, '2026-08-18', 'LAB-2026-0062'),
  (63, 10, 2, 2, 4, '2026-08-21', 'LAB-2026-0063'),
  (64, 17, 1, 1, 5, '2026-08-25', 'LAB-2026-0064'),
  (65, 6, 1, 1, 6, '2026-08-28', 'LAB-2026-0065'),
  (66, 13, 4, 4, 1, '2026-08-31', 'LAB-2026-0066'),
  (67, 2, 3, 3, 2, '2026-09-03', 'LAB-2026-0067'),
  (68, 9, 2, 2, 3, '2026-09-07', 'LAB-2026-0068');


-- solicitacao: 137 registros

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (1, 1, 6, 'CONCLUIDO', 73.95, '2026-08-05'),
  (2, 1, 9, 'CONCLUIDO', 63.75, '2026-08-05'),
  (3, 2, 1, 'CONCLUIDO', 46.75, '2026-08-09'),
  (4, 2, 4, 'CONCLUIDO', 40.8, '2026-08-09'),
  (5, 2, 7, 'PENDENTE', 32.3, '2026-08-09'),
  (6, 3, 6, 'CONCLUIDO', 73.95, '2026-08-10'),
  (7, 4, 1, 'CANCELADO', 55, '2026-08-15'),
  (8, 4, 4, 'CONCLUIDO', 48, '2026-08-15'),
  (9, 5, 6, 'CONCLUIDO', 87, '2026-08-19'),
  (10, 5, 9, 'CONCLUIDO', 75, '2026-08-19'),
  (11, 5, 2, 'CONCLUIDO', 32, '2026-08-19'),
  (12, 6, 1, 'PENDENTE', 46.75, '2026-08-20'),
  (13, 7, 7, 'CONCLUIDO', 32.3, '2026-08-24'),
  (14, 7, 10, 'CANCELADO', 93.5, '2026-08-24'),
  (15, 8, 2, 'CONCLUIDO', 27.2, '2026-08-29');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (16, 8, 5, 'CONCLUIDO', 78.2, '2026-08-29'),
  (17, 8, 8, 'CONCLUIDO', 114.75, '2026-08-29'),
  (18, 9, 7, 'CONCLUIDO', 38, '2026-08-30'),
  (19, 10, 2, 'PENDENTE', 32, '2026-09-03'),
  (20, 10, 5, 'CONCLUIDO', 92, '2026-09-03'),
  (21, 11, 7, 'CANCELADO', 32.3, '2026-09-07'),
  (22, 11, 10, 'CONCLUIDO', 93.5, '2026-09-07'),
  (23, 11, 3, 'CONCLUIDO', 38.25, '2026-09-07'),
  (24, 12, 2, 'CONCLUIDO', 27.2, '2026-09-09'),
  (25, 13, 7, 'CONCLUIDO', 32.3, '2026-09-13'),
  (26, 13, 10, 'PENDENTE', 93.5, '2026-09-13'),
  (27, 14, 3, 'CONCLUIDO', 45, '2026-09-17'),
  (28, 14, 6, 'CANCELADO', 87, '2026-09-17'),
  (29, 14, 9, 'CONCLUIDO', 75, '2026-09-17'),
  (30, 15, 8, 'CONCLUIDO', 135, '2026-09-18');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (31, 16, 3, 'CONCLUIDO', 38.25, '2026-09-23'),
  (32, 16, 6, 'CONCLUIDO', 73.95, '2026-09-23'),
  (33, 17, 8, 'PENDENTE', 114.75, '2026-09-27'),
  (34, 17, 1, 'CONCLUIDO', 46.75, '2026-09-27'),
  (35, 17, 4, 'CANCELADO', 40.8, '2026-09-27'),
  (36, 18, 3, 'CONCLUIDO', 38.25, '2026-09-28'),
  (37, 19, 8, 'CONCLUIDO', 135, '2026-10-02'),
  (38, 19, 1, 'CONCLUIDO', 55, '2026-10-02'),
  (39, 20, 3, 'CONCLUIDO', 45, '2026-10-07'),
  (40, 20, 6, 'PENDENTE', 87, '2026-10-07'),
  (41, 20, 9, 'CONCLUIDO', 75, '2026-10-07'),
  (42, 21, 9, 'CANCELADO', 63.75, '2026-10-08'),
  (43, 22, 4, 'CONCLUIDO', 40.8, '2026-10-12'),
  (44, 22, 7, 'CONCLUIDO', 32.3, '2026-10-12'),
  (45, 23, 9, 'CONCLUIDO', 63.75, '2026-10-16');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (46, 23, 2, 'CONCLUIDO', 27.2, '2026-10-16'),
  (47, 23, 5, 'PENDENTE', 78.2, '2026-10-16'),
  (48, 24, 4, 'CONCLUIDO', 48, '2026-10-18'),
  (49, 25, 9, 'CANCELADO', 75, '2026-10-22'),
  (50, 25, 2, 'CONCLUIDO', 32, '2026-10-22'),
  (51, 26, 4, 'CONCLUIDO', 40.8, '2026-10-26'),
  (52, 26, 7, 'CONCLUIDO', 32.3, '2026-10-26'),
  (53, 26, 10, 'CONCLUIDO', 93.5, '2026-10-26'),
  (54, 27, 9, 'PENDENTE', 63.75, '2026-10-27'),
  (55, 28, 5, 'CONCLUIDO', 78.2, '2026-11-01'),
  (56, 28, 8, 'CANCELADO', 114.75, '2026-11-01'),
  (57, 29, 10, 'CONCLUIDO', 110, '2026-08-05'),
  (58, 29, 3, 'CONCLUIDO', 45, '2026-08-05'),
  (59, 29, 6, 'CONCLUIDO', 87, '2026-08-05'),
  (60, 30, 5, 'CONCLUIDO', 92, '2026-08-06');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (61, 31, 10, 'PENDENTE', 93.5, '2026-08-10'),
  (62, 31, 3, 'CONCLUIDO', 38.25, '2026-08-10'),
  (63, 32, 5, 'CANCELADO', 78.2, '2026-08-15'),
  (64, 32, 8, 'CONCLUIDO', 114.75, '2026-08-15'),
  (65, 32, 1, 'CONCLUIDO', 46.75, '2026-08-15'),
  (66, 33, 10, 'CONCLUIDO', 93.5, '2026-08-16'),
  (67, 34, 5, 'CONCLUIDO', 92, '2026-08-20'),
  (68, 34, 8, 'PENDENTE', 135, '2026-08-20'),
  (69, 35, 1, 'CONCLUIDO', 55, '2026-08-24'),
  (70, 35, 4, 'CANCELADO', 48, '2026-08-24'),
  (71, 35, 7, 'CONCLUIDO', 38, '2026-08-24'),
  (72, 36, 6, 'CONCLUIDO', 73.95, '2026-08-26'),
  (73, 37, 1, 'CONCLUIDO', 46.75, '2026-08-30'),
  (74, 37, 4, 'CONCLUIDO', 40.8, '2026-08-30'),
  (75, 38, 6, 'PENDENTE', 73.95, '2026-09-03');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (76, 38, 9, 'CONCLUIDO', 63.75, '2026-09-03'),
  (77, 38, 2, 'CANCELADO', 27.2, '2026-09-03'),
  (78, 39, 1, 'CONCLUIDO', 55, '2026-09-04'),
  (79, 40, 6, 'CONCLUIDO', 87, '2026-09-09'),
  (80, 40, 9, 'CONCLUIDO', 75, '2026-09-09'),
  (81, 41, 1, 'CONCLUIDO', 46.75, '2026-09-13'),
  (82, 41, 4, 'PENDENTE', 40.8, '2026-09-13'),
  (83, 41, 7, 'CONCLUIDO', 32.3, '2026-09-13'),
  (84, 42, 7, 'CANCELADO', 32.3, '2026-09-14'),
  (85, 43, 2, 'CONCLUIDO', 27.2, '2026-09-18'),
  (86, 43, 5, 'CONCLUIDO', 78.2, '2026-09-18'),
  (87, 44, 7, 'CONCLUIDO', 38, '2026-09-23'),
  (88, 44, 10, 'CONCLUIDO', 110, '2026-09-23'),
  (89, 44, 3, 'PENDENTE', 45, '2026-09-23'),
  (90, 45, 2, 'CONCLUIDO', 32, '2026-09-24');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (91, 46, 7, 'CANCELADO', 32.3, '2026-09-28'),
  (92, 46, 10, 'CONCLUIDO', 93.5, '2026-09-28'),
  (93, 47, 2, 'CONCLUIDO', 27.2, '2026-10-02'),
  (94, 47, 5, 'CONCLUIDO', 78.2, '2026-10-02'),
  (95, 47, 8, 'CONCLUIDO', 114.75, '2026-10-02'),
  (96, 48, 7, 'PENDENTE', 32.3, '2026-10-04'),
  (97, 49, 3, 'CONCLUIDO', 45, '2026-10-08'),
  (98, 49, 6, 'CANCELADO', 87, '2026-10-08'),
  (99, 50, 8, 'CONCLUIDO', 135, '2026-10-12'),
  (100, 50, 1, 'CONCLUIDO', 55, '2026-10-12'),
  (101, 50, 4, 'CONCLUIDO', 48, '2026-10-12'),
  (102, 51, 3, 'CONCLUIDO', 38.25, '2026-10-13'),
  (103, 52, 8, 'PENDENTE', 114.75, '2026-10-18'),
  (104, 52, 1, 'CONCLUIDO', 46.75, '2026-10-18'),
  (105, 53, 3, 'CANCELADO', 38.25, '2026-10-22');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (106, 53, 6, 'CONCLUIDO', 73.95, '2026-10-22'),
  (107, 53, 9, 'CONCLUIDO', 63.75, '2026-10-22'),
  (108, 54, 8, 'CONCLUIDO', 135, '2026-10-23'),
  (109, 55, 3, 'CONCLUIDO', 45, '2026-10-27'),
  (110, 55, 6, 'PENDENTE', 87, '2026-10-27'),
  (111, 56, 9, 'CONCLUIDO', 63.75, '2026-11-01'),
  (112, 56, 2, 'CANCELADO', 27.2, '2026-11-01'),
  (113, 56, 5, 'CONCLUIDO', 78.2, '2026-11-01'),
  (114, 57, 4, 'CONCLUIDO', 40.8, '2026-08-02'),
  (115, 58, 9, 'CONCLUIDO', 63.75, '2026-08-06'),
  (116, 58, 2, 'CONCLUIDO', 27.2, '2026-08-06'),
  (117, 59, 4, 'PENDENTE', 48, '2026-08-10'),
  (118, 59, 7, 'CONCLUIDO', 38, '2026-08-10'),
  (119, 59, 10, 'CANCELADO', 110, '2026-08-10'),
  (120, 60, 9, 'CONCLUIDO', 75, '2026-08-12');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (121, 61, 4, 'CONCLUIDO', 40.8, '2026-08-16'),
  (122, 61, 7, 'CONCLUIDO', 32.3, '2026-08-16'),
  (123, 62, 9, 'CONCLUIDO', 63.75, '2026-08-20'),
  (124, 62, 2, 'PENDENTE', 27.2, '2026-08-20'),
  (125, 62, 5, 'CONCLUIDO', 78.2, '2026-08-20'),
  (126, 63, 5, 'CANCELADO', 78.2, '2026-08-21'),
  (127, 64, 10, 'CONCLUIDO', 110, '2026-08-26'),
  (128, 64, 3, 'CONCLUIDO', 45, '2026-08-26'),
  (129, 65, 5, 'CONCLUIDO', 92, '2026-08-30'),
  (130, 65, 8, 'CONCLUIDO', 135, '2026-08-30'),
  (131, 65, 1, 'PENDENTE', 55, '2026-08-30'),
  (132, 66, 10, 'CONCLUIDO', 93.5, '2026-08-31'),
  (133, 67, 5, 'CANCELADO', 78.2, '2026-09-04'),
  (134, 67, 8, 'CONCLUIDO', 114.75, '2026-09-04'),
  (135, 68, 10, 'CONCLUIDO', 93.5, '2026-09-09');

INSERT INTO solicitacao (id_solicitacao, id_atendimento, id_exame, status, valor_praticado, data_coleta) VALUES
  (136, 68, 3, 'CONCLUIDO', 38.25, '2026-09-09'),
  (137, 68, 6, 'CONCLUIDO', 73.95, '2026-09-09');


-- resultado: 99 registros

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (1, 1, '2026-08-07', 'LIBERADO'),
  (2, 2, '2026-08-08', 'LIBERADO'),
  (3, 3, '2026-08-13', 'LIBERADO'),
  (4, 4, '2026-08-14', 'LIBERADO'),
  (5, 6, '2026-08-11', 'LIBERADO'),
  (6, 8, '2026-08-18', 'LIBERADO'),
  (7, 9, '2026-08-23', 'LIBERADO'),
  (8, 10, '2026-08-24', 'LIBERADO'),
  (9, 11, '2026-08-25', 'LIBERADO'),
  (10, 13, '2026-08-26', 'LIBERADO'),
  (11, 15, '2026-09-02', 'LIBERADO'),
  (12, 16, '2026-09-03', 'LIBERADO'),
  (13, 17, '2026-09-04', 'LIBERADO'),
  (14, 18, '2026-08-31', 'LIBERADO'),
  (15, 20, '2026-09-06', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (16, 22, '2026-09-12', 'LIBERADO'),
  (17, 23, '2026-09-13', 'LIBERADO'),
  (18, 24, '2026-09-10', 'LIBERADO'),
  (19, 25, '2026-09-15', 'LIBERADO'),
  (20, 27, '2026-09-21', 'LIBERADO'),
  (21, 29, '2026-09-23', 'LIBERADO'),
  (22, 30, '2026-09-19', 'LIBERADO'),
  (23, 31, '2026-09-25', 'LIBERADO'),
  (24, 32, '2026-09-26', 'LIBERADO'),
  (25, 34, '2026-10-02', 'LIBERADO'),
  (26, 36, '2026-09-29', 'LIBERADO'),
  (27, 37, '2026-10-04', 'LIBERADO'),
  (28, 38, '2026-10-05', 'LIBERADO'),
  (29, 39, '2026-10-11', 'LIBERADO'),
  (30, 41, '2026-10-13', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (31, 43, '2026-10-14', 'LIBERADO'),
  (32, 44, '2026-10-15', 'LIBERADO'),
  (33, 45, '2026-10-20', 'LIBERADO'),
  (34, 46, '2026-10-21', 'LIBERADO'),
  (35, 48, '2026-10-19', 'LIBERADO'),
  (36, 50, '2026-10-25', 'LIBERADO'),
  (37, 51, '2026-10-30', 'LIBERADO'),
  (38, 52, '2026-10-31', 'LIBERADO'),
  (39, 53, '2026-11-01', 'LIBERADO'),
  (40, 55, '2026-11-03', 'LIBERADO'),
  (41, 57, '2026-08-09', 'LIBERADO'),
  (42, 58, '2026-08-10', 'LIBERADO'),
  (43, 59, '2026-08-11', 'LIBERADO'),
  (44, 60, '2026-08-07', 'LIBERADO'),
  (45, 62, '2026-08-13', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (46, 64, '2026-08-20', 'LIBERADO'),
  (47, 65, '2026-08-21', 'LIBERADO'),
  (48, 66, '2026-08-17', 'LIBERADO'),
  (49, 67, '2026-08-22', 'LIBERADO'),
  (50, 69, '2026-08-28', 'LIBERADO'),
  (51, 71, '2026-08-30', 'LIBERADO'),
  (52, 72, '2026-08-27', 'LIBERADO'),
  (53, 73, '2026-09-01', 'LIBERADO'),
  (54, 74, '2026-09-02', 'LIBERADO'),
  (55, 76, '2026-09-08', 'LIBERADO'),
  (56, 78, '2026-09-05', 'LIBERADO'),
  (57, 79, '2026-09-11', 'LIBERADO'),
  (58, 80, '2026-09-12', 'LIBERADO'),
  (59, 81, '2026-09-17', 'LIBERADO'),
  (60, 83, '2026-09-19', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (61, 85, '2026-09-20', 'LIBERADO'),
  (62, 86, '2026-09-21', 'LIBERADO'),
  (63, 87, '2026-09-27', 'LIBERADO'),
  (64, 88, '2026-09-28', 'LIBERADO'),
  (65, 90, '2026-09-25', 'LIBERADO'),
  (66, 92, '2026-10-01', 'LIBERADO'),
  (67, 93, '2026-10-06', 'LIBERADO'),
  (68, 94, '2026-10-07', 'LIBERADO'),
  (69, 95, '2026-10-08', 'LIBERADO'),
  (70, 97, '2026-10-10', 'LIBERADO'),
  (71, 99, '2026-10-16', 'LIBERADO'),
  (72, 100, '2026-10-17', 'LIBERADO'),
  (73, 101, '2026-10-18', 'LIBERADO'),
  (74, 102, '2026-10-14', 'LIBERADO'),
  (75, 104, '2026-10-21', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (76, 106, '2026-10-27', 'LIBERADO'),
  (77, 107, '2026-10-28', 'LIBERADO'),
  (78, 108, '2026-10-24', 'LIBERADO'),
  (79, 109, '2026-10-29', 'LIBERADO'),
  (80, 111, '2026-11-05', 'LIBERADO'),
  (81, 113, '2026-11-07', 'LIBERADO'),
  (82, 114, '2026-08-03', 'LIBERADO'),
  (83, 115, '2026-08-08', 'LIBERADO'),
  (84, 116, '2026-08-09', 'LIBERADO'),
  (85, 118, '2026-08-15', 'LIBERADO'),
  (86, 120, '2026-08-13', 'LIBERADO'),
  (87, 121, '2026-08-18', 'LIBERADO'),
  (88, 122, '2026-08-19', 'LIBERADO'),
  (89, 123, '2026-08-24', 'LIBERADO'),
  (90, 125, '2026-08-26', 'LIBERADO');

INSERT INTO resultado (id_resultado, id_solicitacao, data_liberacao, situacao) VALUES
  (91, 127, '2026-08-28', 'LIBERADO'),
  (92, 128, '2026-08-29', 'LIBERADO'),
  (93, 129, '2026-09-03', 'LIBERADO'),
  (94, 130, '2026-09-04', 'LIBERADO'),
  (95, 132, '2026-09-01', 'LIBERADO'),
  (96, 134, '2026-09-07', 'LIBERADO'),
  (97, 135, '2026-09-13', 'LIBERADO'),
  (98, 136, '2026-09-14', 'LIBERADO'),
  (99, 137, '2026-09-15', 'LIBERADO');


-- Conferência de carga (somente SELECTs auxiliares; não são as respostas da atividade)
SELECT 'unidade' AS tabela, COUNT(*) AS registros FROM unidade
UNION ALL SELECT 'convenio', COUNT(*) FROM convenio
UNION ALL SELECT 'paciente', COUNT(*) FROM paciente
UNION ALL SELECT 'profissional', COUNT(*) FROM profissional
UNION ALL SELECT 'exame', COUNT(*) FROM exame
UNION ALL SELECT 'atendimento', COUNT(*) FROM atendimento
UNION ALL SELECT 'solicitacao', COUNT(*) FROM solicitacao
UNION ALL SELECT 'resultado', COUNT(*) FROM resultado;


#Query 01
#Liste protocolo, paciente, unidade, exame, data da coleta, data de liberação e valor praticado 
#de cada solicitação CONCLUIDA. Ordene da liberação mais recente para a mais antiga e por protocolo crescente.
select a.numero_protocolo as "Protocolo", p.nome as "Paciente", u.nome as "Unidade", e.nome as "Exame", s.data_coleta as "Data coleta", 
r.data_liberacao as "Data de liberação", s.valor_praticado as "Valor praticado" from atendimento a 
inner join paciente p on p.id_paciente = a.id_paciente
inner join unidade u on u.id_unidade = a.id_unidade
inner join solicitacao s on s.id_atendimento = a.id_atendimento
inner join exame e on e.id_exame = s.id_exame
inner join resultado r on r.id_solicitacao = s.id_solicitacao
where upper(s.status) = 'concluido'
order by r.data_liberacao desc, a.numero_protocolo asc;

#Query 02
#Apresente unidade, total de solicitações CONCLUIDAS, quantidade de pacientes distintos e faturamento total. 
#Exiba apenas unidades com faturamento acima de R$ 700,00, ordenadas pelo maior faturamento.
select  u.nome as "Unidade", count(s.id_solicitacao) as "Total solicitações", count(distinct a.id_paciente) as "Total pacientes", sum(s.valor_praticado) as "Faturamento"
from unidade u 
inner join atendimento a on a.id_unidade = u.id_unidade
inner join solicitacao s on a.id_atendimento = s.id_atendimento
inner join paciente p on p.id_paciente = a.id_paciente
where upper(s.status) = 'concluido'
group by u.nome
having sum(s.valor_praticado) > 700
order by sum(s.valor_praticado) desc;

#Query 03
#Mostre todos os exames cadastrados, inclusive aqueles sem solicitações, com total de solicitações e total de conclusões. 
#Ordene da maior para a menor demanda e, no empate, por nome.
select e.nome as "Exames", count(s.id_solicitacao) as "Total solicitações", count(s.id_solicitacao) as "Total conclusões" from exame e
 left join solicitacao s on s.id_exame = e.id_exame
 group by e.nome
 order by count(s.id_solicitacao) desc, e.nome desc;
 
 #Query 04
 #Relacione convênio, número de exames concluídos, pacientes distintos e receita correspondente. Ignore solicitações pendentes e canceladas. Ordene pelo valor decrescente.
select c.nome as "Convênio", count(s.id_solicitacao) as "Exames concluídos", count(distinct a.id_paciente) as "Pacientes", sum(s.valor_praticado) as "Receita"
from convenio c
inner join atendimento a on a.id_convenio = c.id_convenio
inner join solicitacao s on s.id_atendimento = a.id_atendimento
where upper(s.status) = 'concluido'
group by c.nome
order by sum(s.valor_praticado) desc;

#Query 05
#Mostre profissional, especialidade e número de solicitações concluídas por profissional. Exiba apenas 
#profissionais com pelo menos 8 exames concluídos, em ordem decrescente de volume.
select p.nome as "Profissional", p.especialidade as "Especialidade",count(a.id_profissional) as "Solicitações" from profissional p
inner join atendimento a on a.id_profissional = p.id_profissional
group by p.nome, p.especialidade, p.id_profissional
having count(a.id_profissional) >= 8
order by count(a.id_profissional) desc;

#Query 06
#Considere como data de referência 05/11/2026. Apresente paciente, exame, data da coleta, prazo em dias e dias transcorridos dos 
#pedidos PENDENTES que ultrapassaram o prazo cadastrado. Ordene pelos mais atrasados
select p.nome as "paciente", e.nome as "exame", s.data_coleta as "data da coleta", e.prazo_dias as "prazo em dias", datediff('2026-11-05', s.data_coleta) as 
"dias transcorridos" from atendimento a
inner join paciente p on p.id_paciente = a.id_paciente
inner join solicitacao s on s.id_atendimento = a.id_atendimento
inner join exame e on e.id_exame = s.id_exame
where lower(s.status) = 'pendente'
  and datediff('2026-11-05', s.data_coleta) > e.prazo_dias
order by (datediff('2026-11-05', s.data_coleta) - e.prazo_dias) desc;

#Query 07
#Liste pacientes com pelo menos 3 atendimentos distintos, trazendo o total de atendimentos e o total de exames solicitados (independentemente do status). 
#Evite contagem duplicada causada pelos JOINs.
select p.nome as "Paciente", count(distinct a.id_atendimento) as "Total atendimentos", count(s.id_solicitacao) as "Total solicitações" from paciente p
inner join atendimento a on a.id_paciente = p.id_paciente
inner join solicitacao s on s.id_atendimento = a.id_atendimento
group by p.nome 
having count(distinct a.id_atendimento)>=3;

#Query 08
#Calcule por mês de atendimento o total de solicitações CONCLUIDAS e a receita. Apresente ano e mês, ordenados cronologicamente. Use o valor praticado.
select year(a.data_atendimento) as "ano", month(a.data_atendimento) as "mês", count(s.id_solicitacao) as "total solicitações", sum(s.valor_praticado) as "receita"
from atendimento a
inner join solicitacao s on s.id_atendimento = a.id_atendimento
where lower(s.status) = 'concluido'
group by year(a.data_atendimento), month(a.data_atendimento)
order by year(a.data_atendimento) asc, month(a.data_atendimento) asc;

#Query 09
#Apresente, por unidade, o total de exames concluídos com resultado liberado e a média de dias entre coleta e liberação, arredondada em duas casas. 
#Exiba apenas unidades com média superior a 2,50 dias.
select u.nome as "unidade",count(s.id_solicitacao) as "total exames concluídos",round(avg(datediff(r.data_liberacao, s.data_coleta)), 2) as "média de dias" from unidade u
inner join atendimento a on a.id_unidade = u.id_unidade
inner join solicitacao s on s.id_atendimento = a.id_atendimento
inner join resultado r on r.id_solicitacao = s.id_solicitacao
where lower(s.status) = 'concluido'
  and r.data_liberacao is not null
group by u.id_unidade, u.nome
having avg(datediff(r.data_liberacao, s.data_coleta)) > 2.50;

#Query 10
#Encontre pacientes que não possuem nenhuma solicitação CONCLUIDA, mesmo que tenham atendimentos pendentes ou não tenham atendimento algum. Ordene alfabeticamente.
select p.nome as "paciente" from paciente p
where not exists (
    select 1
    from atendimento a
    inner join solicitacao s on s.id_atendimento = a.id_atendimento
    where a.id_paciente = p.id_paciente
      and lower(s.status) = 'concluida'
)
order by p.nome asc;

#Query 11
#Calcule categoria, número de exames concluídos e receita total. Mantenha apenas categorias com pelo menos 10 exames concluídos e receita acima de R$ 700,00; 
#ordene pela receita decrescente.
select e.categoria as "categoria", count(s.id_solicitacao) as "exames concluídos", sum(s.valor_praticado) as "receita" from exame e
inner join solicitacao s on s.id_exame = e.id_exame
where lower(s.status) = 'concluido'
group by e.categoria
having count(s.id_solicitacao) >= 10 
   and sum(s.valor_praticado) > 700
order by sum(s.valor_praticado) desc;

#Query 12
#Para cada combinação unidade-convênio, apresente pacientes distintos, exames concluídos e receita; retenha somente combinações 
#com pelo menos 3 pacientes, 5 exames concluídos e R$ 300,00 de receita. Ordene por receita decrescente.
select u.nome as "unidade",c.nome as "convênio",count(distinct a.id_paciente) as "pacientes distintos",count(s.id_solicitacao) as "exames concluídos",sum(s.valor_praticado) 
as "receita" from unidade u
inner join atendimento a on a.id_unidade = u.id_unidade
inner join convenio c on c.id_convenio = a.id_convenio
inner join solicitacao s on s.id_atendimento = a.id_atendimento
where lower(s.status) = 'concluido'
group by u.id_unidade, u.nome,c.id_convenio, c.nome
having count(distinct a.id_paciente) >= 3 and count(s.id_solicitacao) >= 5 and sum(s.valor_praticado) >= 300
order by sum(s.valor_praticado) desc;