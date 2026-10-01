
-- ============================================================
-- BANCO DE DADOS: oficina_mecanica
-- Modelo baseado no estudo de caso da Oficina Mecânica
-- Compatível com MySQL 8.0+
-- ============================================================

DROP DATABASE IF EXISTS oficina_mecanica;
CREATE DATABASE oficina_mecanica
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE oficina_mecanica;

-- ============================================================
-- TABELA: cliente
-- ============================================================

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(120),
    logradouro VARCHAR(150),
    numero VARCHAR(20),
    complemento VARCHAR(80),
    bairro VARCHAR(80),
    cidade VARCHAR(80),
    uf CHAR(2),
    cep VARCHAR(10),
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_cliente_uf CHECK (uf IS NULL OR CHAR_LENGTH(uf) = 2)
);

-- ============================================================
-- TABELA: veiculo
-- ============================================================

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    renavam VARCHAR(20) UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    ano SMALLINT,
    cor VARCHAR(40),
    quilometragem_atual INT DEFAULT 0,
    CONSTRAINT chk_veiculo_ano CHECK (ano IS NULL OR ano BETWEEN 1900 AND 2100),
    CONSTRAINT chk_veiculo_quilometragem CHECK (quilometragem_atual >= 0),
    CONSTRAINT fk_veiculo_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_veiculo_cliente ON veiculo(id_cliente);
CREATE INDEX idx_veiculo_marca_modelo ON veiculo(marca, modelo);

-- ============================================================
-- TABELA: servico
-- ============================================================

CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor_mao_obra DECIMAL(10,2) NOT NULL,
    tempo_estimado_min INT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_servico_valor CHECK (valor_mao_obra >= 0),
    CONSTRAINT chk_servico_tempo CHECK (tempo_estimado_min IS NULL OR tempo_estimado_min > 0)
);

-- ============================================================
-- TABELA: peca
-- ============================================================

CREATE TABLE peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    fabricante VARCHAR(100),
    codigo_fabricante VARCHAR(60),
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    estoque_minimo INT NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (codigo_fabricante),
    CONSTRAINT chk_peca_valor CHECK (valor_unitario >= 0),
    CONSTRAINT chk_peca_estoque CHECK (quantidade_estoque >= 0),
    CONSTRAINT chk_peca_estoque_minimo CHECK (estoque_minimo >= 0)
);

CREATE INDEX idx_peca_descricao ON peca(descricao);
CREATE INDEX idx_peca_fabricante ON peca(fabricante);

-- ============================================================
-- TABELA: orcamento
-- ============================================================

CREATE TABLE orcamento (
    id_orcamento INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    data_orcamento DATE NOT NULL,
    validade DATE NOT NULL,
    valor_servicos DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    valor_pecas DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    valor_total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    status ENUM('Aguardando aprovação','Aprovado','Recusado','Vencido') 
        NOT NULL DEFAULT 'Aguardando aprovação',
    observacao VARCHAR(255),
    CONSTRAINT fk_orcamento_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_orcamento_veiculo ON orcamento(id_veiculo);
CREATE INDEX idx_orcamento_status ON orcamento(status);
CREATE INDEX idx_orcamento_data ON orcamento(data_orcamento);

-- ============================================================
-- TABELA: ordem_servico
-- ============================================================

CREATE TABLE ordem_servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_orcamento INT NULL UNIQUE,
    data_abertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fechamento DATETIME NULL,
    quilometragem_entrada INT NOT NULL,
    defeito_relatado TEXT,
    observacao TEXT,
    status ENUM('Aberta','Em diagnóstico','Aguardando aprovação','Em execução',
                'Aguardando peça','Concluída','Cancelada')
        NOT NULL DEFAULT 'Aberta',
    CONSTRAINT fk_os_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_os_orcamento
        FOREIGN KEY (id_orcamento)
        REFERENCES orcamento(id_orcamento)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE INDEX idx_os_veiculo ON ordem_servico(id_veiculo);
CREATE INDEX idx_os_status ON ordem_servico(status);
CREATE INDEX idx_os_data_abertura ON ordem_servico(data_abertura);

-- ============================================================
-- TABELA ASSOCIATIVA: os_servico
-- ============================================================

CREATE TABLE os_servico (
    id_os_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL DEFAULT 1.00,
    valor_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) GENERATED ALWAYS AS (quantidade * valor_unitario) STORED,
    observacao VARCHAR(255),
    CONSTRAINT chk_os_servico_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_os_servico_valor CHECK (valor_unitario >= 0),
    CONSTRAINT fk_os_servico_os
        FOREIGN KEY (id_os)
        REFERENCES ordem_servico(id_os)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_os_servico_servico
        FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_os_servico_servico ON os_servico(id_servico);

-- ============================================================
-- TABELA ASSOCIATIVA: os_peca
-- ============================================================

CREATE TABLE os_peca (
    id_os_peca INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) GENERATED ALWAYS AS (quantidade * valor_unitario) STORED,
    CONSTRAINT chk_os_peca_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_os_peca_valor CHECK (valor_unitario >= 0),
    CONSTRAINT fk_os_peca_os
        FOREIGN KEY (id_os)
        REFERENCES ordem_servico(id_os)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_os_peca_peca
        FOREIGN KEY (id_peca)
        REFERENCES peca(id_peca)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_os_peca_peca ON os_peca(id_peca);

-- ============================================================
-- TABELA: faturamento
-- ============================================================

CREATE TABLE faturamento (
    id_faturamento INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT NOT NULL UNIQUE,
    data_faturamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(12,2) NOT NULL,
    forma_pagamento ENUM('Dinheiro','PIX','Cartão de Débito','Cartão de Crédito','Boleto')
        NOT NULL,
    status_pagamento ENUM('Pendente','Pago','Parcial','Cancelado')
        NOT NULL DEFAULT 'Pendente',
    observacao VARCHAR(255),
    CONSTRAINT fk_faturamento_os
        FOREIGN KEY (id_os)
        REFERENCES ordem_servico(id_os)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_faturamento_status ON faturamento(status_pagamento);
CREATE INDEX idx_faturamento_data ON faturamento(data_faturamento);

-- ============================================================
-- DADOS: cliente
-- ============================================================

INSERT INTO cliente
(nome, cpf_cnpj, telefone, email, logradouro, numero, complemento, bairro, cidade, uf, cep)
VALUES
('João Carlos de Souza','123.456.789-01','(13) 99711-1001','joao.souza@email.com','Rua das Palmeiras','125',NULL,'Centro','Registro','SP','11900-000'),
('Mariana Alves Ferreira','234.567.890-12','(13) 99722-1002','mariana.ferreira@email.com','Av. Clara Gianotti de Souza','880','Apto 12','Vila Romão','Registro','SP','11900-000'),
('Carlos Eduardo Lima','345.678.901-23','(13) 99733-1003','carlos.lima@email.com','Rua Tamekishi Takano','430',NULL,'Centro','Registro','SP','11900-000'),
('Fernanda Martins Rocha','456.789.012-34','(13) 99744-1004','fernanda.rocha@email.com','Rua Peruíbe','76',NULL,'Jardim Caiçara','Registro','SP','11900-000'),
('Paulo Henrique Mendes','567.890.123-45','(13) 99755-1005','paulo.mendes@email.com','Rua Guaracuí','211','Casa B','Vila Nova','Registro','SP','11900-000'),
('Ana Paula Ribeiro','678.901.234-56','(13) 99766-1006','ana.ribeiro@email.com','Av. Wild José de Souza','998',NULL,'Centro','Registro','SP','11900-000'),
('Ricardo Gomes Batista','789.012.345-67','(13) 99777-1007','ricardo.batista@email.com','Rua Miguel Aby-Azar','52',NULL,'Jardim Brasil','Registro','SP','11900-000'),
('Patrícia Moreira Santos','890.123.456-78','(13) 99788-1008','patricia.santos@email.com','Rua José Antônio de Campos','333',NULL,'Vila Fátima','Registro','SP','11900-000'),
('Mecânica Vale Sul Ltda','12.345.678/0001-90','(13) 3821-9090','financeiro@valesul.com.br','Rodovia Régis Bittencourt','KM 444','Galpão 3','Zona Industrial','Registro','SP','11900-000'),
('Mercado Bom Preço Ltda','98.765.432/0001-10','(13) 3822-7070','administracao@bompreco.com.br','Av. Haguemu Matsuzawa','1500',NULL,'Centro','Registro','SP','11900-000'),
('Lucas Andrade Costa','901.234.567-89','(13) 99611-1011','lucas.costa@email.com','Rua do Comércio','74',NULL,'Centro','Jacupiranga','SP','11940-000'),
('Beatriz Nunes Carvalho','012.345.678-90','(13) 99622-1012','beatriz.carvalho@email.com','Rua Pedro Bonne','190',NULL,'Centro','Pariquera-Açu','SP','11930-000');

-- ============================================================
-- DADOS: veiculo
-- ============================================================

INSERT INTO veiculo
(id_cliente, placa, renavam, marca, modelo, ano, cor, quilometragem_atual)
VALUES
(1,'ABC1D23','11111111111','Volkswagen','Gol 1.0',2018,'Prata',78500),
(1,'EFG4H56','11111111112','Honda','CG 160',2021,'Vermelha',23400),
(2,'HIJ7K89','11111111113','Chevrolet','Onix LT',2020,'Branco',51200),
(3,'LMN1O23','11111111114','Toyota','Corolla XEi',2019,'Preto',67300),
(4,'PQR4S56','11111111115','Hyundai','HB20 Comfort',2017,'Cinza',92100),
(5,'TUV7W89','11111111116','Fiat','Strada Endurance',2022,'Branco',44600),
(6,'XYZ1A23','11111111117','Renault','Sandero Zen',2020,'Azul',38900),
(7,'BCD4E56','11111111118','Jeep','Renegade Longitude',2021,'Preto',32700),
(8,'FGH7I89','11111111119','Ford','Ka SE',2018,'Branco',81500),
(9,'JKL1M23','11111111120','Fiat','Fiorino',2020,'Branco',104500),
(9,'NOP4Q56','11111111121','Volkswagen','Saveiro Robust',2019,'Prata',118900),
(10,'RST7U89','11111111122','Renault','Master Furgão',2021,'Branco',97600),
(11,'VWX1Y23','11111111123','Nissan','Kicks SV',2022,'Cinza',28900),
(12,'ZAB4C56','11111111124','Honda','Fit EX',2016,'Prata',123700),
(3,'DEF7G89','11111111125','Toyota','Hilux SRV',2020,'Prata',88400);

-- ============================================================
-- DADOS: servico
-- ============================================================

INSERT INTO servico
(descricao, valor_mao_obra, tempo_estimado_min)
VALUES
('Troca de óleo e filtro',80.00,40),
('Alinhamento dianteiro',120.00,50),
('Balanceamento de rodas',100.00,45),
('Substituição de pastilhas de freio',180.00,90),
('Substituição de discos de freio',250.00,120),
('Troca de correia dentada',450.00,240),
('Revisão do sistema de suspensão',220.00,120),
('Troca de amortecedores dianteiros',380.00,180),
('Diagnóstico eletrônico',150.00,60),
('Limpeza de bicos injetores',280.00,150),
('Troca de velas de ignição',120.00,60),
('Troca de bateria',70.00,30),
('Revisão do sistema de arrefecimento',190.00,90),
('Troca de embreagem',750.00,360),
('Revisão preventiva completa',500.00,300),
('Higienização do ar-condicionado',180.00,90),
('Troca de filtro de ar',50.00,20),
('Troca de filtro de combustível',90.00,40),
('Substituição de lâmpadas',40.00,20),
('Troca de correia de acessórios',180.00,90);

-- ============================================================
-- DADOS: peca
-- ============================================================

INSERT INTO peca
(descricao, fabricante, codigo_fabricante, valor_unitario, quantidade_estoque, estoque_minimo)
VALUES
('Filtro de óleo','Tecfil','TF-OL001',38.90,35,10),
('Óleo lubrificante 5W30 1L','Mobil','MB-5W30-1L',52.00,80,20),
('Pastilha de freio dianteira','Cobreq','CB-PF100',189.90,18,5),
('Disco de freio dianteiro','Fremax','FX-DF200',265.00,10,4),
('Correia dentada','Gates','GT-CD300',210.00,12,4),
('Tensor da correia','SKF','SKF-TC301',175.00,10,3),
('Amortecedor dianteiro','Cofap','CF-AD400',420.00,14,4),
('Kit batente amortecedor','Axios','AX-BA401',95.00,20,6),
('Vela de ignição','NGK','NGK-VI500',42.50,40,12),
('Bateria 60Ah','Moura','MR-BT600',510.00,9,3),
('Filtro de ar','Tecfil','TF-AR700',55.00,25,8),
('Filtro de combustível','Mahle','MH-FC800',68.00,22,8),
('Aditivo para radiador 1L','Paraflu','PF-AR900',39.90,30,10),
('Fluido de freio DOT 4','Bosch','BS-FF1000',34.90,24,8),
('Kit de embreagem','Luk','LK-KE1100',890.00,7,2),
('Correia de acessórios','Continental','CT-CA1200',135.00,15,5),
('Lâmpada H7','Philips','PH-H71300',48.00,30,10),
('Palheta limpador 22 pol','Bosch','BS-PL1400',62.00,18,6),
('Fluido de arrefecimento 1L','Radiex','RX-FA1500',32.00,40,12),
('Sensor de temperatura','MTE','MTE-ST1600',120.00,8,3),
('Bucha de bandeja','Axios','AX-BB1700',85.00,16,5),
('Pivô de suspensão','Nakata','NK-PS1800',130.00,14,4),
('Terminal de direção','Nakata','NK-TD1900',115.00,12,4),
('Óleo de câmbio 75W90 1L','Motul','MT-75902000',98.00,20,6),
('Filtro de cabine','Tecfil','TF-FC2100',72.00,22,7);

-- ============================================================
-- DADOS: orcamento
-- ============================================================

INSERT INTO orcamento
(id_veiculo, data_orcamento, validade, valor_servicos, valor_pecas, valor_total, status, observacao)
VALUES
(1,'2026-01-12','2026-01-19',200.00,246.90,446.90,'Aprovado','Troca de óleo, filtro e alinhamento'),
(3,'2026-01-20','2026-01-27',330.00,738.80,1068.80,'Aprovado','Freios dianteiros'),
(4,'2026-02-03','2026-02-10',600.00,385.00,985.00,'Aprovado','Correia dentada e tensor'),
(5,'2026-02-15','2026-02-22',600.00,1030.00,1630.00,'Recusado','Suspensão dianteira completa'),
(6,'2026-03-02','2026-03-09',650.00,357.90,1007.90,'Aprovado','Revisão preventiva'),
(7,'2026-03-19','2026-03-26',270.00,510.00,780.00,'Aprovado','Bateria e diagnóstico'),
(8,'2026-04-01','2026-04-08',330.00,285.00,615.00,'Aprovado','Velas, filtro de ar e combustível'),
(9,'2026-04-18','2026-04-25',450.00,1060.00,1510.00,'Aprovado','Freios dianteiros'),
(10,'2026-05-06','2026-05-13',300.00,230.00,530.00,'Aprovado','Correia de acessórios e revisão'),
(11,'2026-05-22','2026-05-29',500.00,0.00,500.00,'Vencido','Revisão preventiva não aprovada'),
(12,'2026-06-04','2026-06-11',900.00,890.00,1790.00,'Aprovado','Kit de embreagem'),
(13,'2026-06-18','2026-06-25',330.00,157.00,487.00,'Aprovado','Filtros e higienização'),
(14,'2026-07-03','2026-07-10',220.00,330.00,550.00,'Aprovado','Suspensão dianteira'),
(15,'2026-07-15','2026-07-22',650.00,476.90,1126.90,'Aprovado','Revisão completa'),
(1,'2026-08-08','2026-08-15',300.00,379.80,679.80,'Aprovado','Pastilhas de freio e fluido'),
(3,'2026-08-20','2026-08-27',150.00,0.00,150.00,'Aprovado','Diagnóstico eletrônico'),
(6,'2026-09-02','2026-09-09',260.00,209.00,469.00,'Aguardando aprovação','Revisão de filtros e palhetas'),
(8,'2026-09-10','2026-09-17',220.00,345.00,565.00,'Recusado','Pivôs e terminais'),
(10,'2026-09-14','2026-09-21',500.00,286.00,786.00,'Aprovado','Manutenção preventiva'),
(13,'2026-09-21','2026-09-28',180.00,72.00,252.00,'Aprovado','Filtro de cabine e higienização');

-- ============================================================
-- DADOS: ordem_servico
-- ============================================================

INSERT INTO ordem_servico
(id_veiculo, id_orcamento, data_abertura, data_fechamento, quilometragem_entrada, defeito_relatado, observacao, status)
VALUES
(1,1,'2026-01-13 08:10:00','2026-01-13 11:20:00',74200,'Cliente solicita revisão e relata volante puxando para a direita','Serviço concluído sem intercorrências','Concluída'),
(3,2,'2026-01-21 09:00:00','2026-01-21 16:30:00',48600,'Ruído ao frear e pedal vibrando','Substituídas pastilhas e discos dianteiros','Concluída'),
(4,3,'2026-02-04 08:20:00','2026-02-05 10:00:00',64200,'Revisão preventiva da correia dentada','Troca preventiva conforme quilometragem','Concluída'),
(6,5,'2026-03-03 07:50:00','2026-03-03 17:30:00',40100,'Revisão periódica','Filtros e fluidos substituídos','Concluída'),
(7,6,'2026-03-20 08:40:00','2026-03-20 12:10:00',35100,'Veículo apresenta dificuldade na partida','Bateria substituída após diagnóstico','Concluída'),
(8,7,'2026-04-02 08:15:00','2026-04-02 14:00:00',29800,'Consumo elevado e perda leve de desempenho','Realizada manutenção preventiva','Concluída'),
(9,8,'2026-04-19 09:10:00','2026-04-20 11:30:00',79200,'Ruído metálico ao acionar o freio','Sistema de freio dianteiro revisado','Concluída'),
(10,9,'2026-05-07 08:05:00','2026-05-07 13:40:00',98600,'Chiado vindo da região do motor','Correia de acessórios substituída','Concluída'),
(12,11,'2026-06-05 08:30:00','2026-06-06 16:00:00',93500,'Pedal de embreagem pesado e dificuldade de engate','Kit completo substituído','Concluída'),
(13,12,'2026-06-19 09:20:00','2026-06-19 15:20:00',26400,'Odor no ar-condicionado e revisão de filtros','Sistema higienizado','Concluída'),
(14,13,'2026-07-04 08:00:00','2026-07-04 15:45:00',119500,'Batidas na suspensão dianteira','Substituição de componentes com folga','Concluída'),
(15,14,'2026-07-16 07:45:00','2026-07-17 11:00:00',84200,'Revisão geral antes de viagem','Revisão preventiva concluída','Concluída'),
(1,15,'2026-08-09 08:10:00','2026-08-09 13:00:00',78100,'Ruído leve durante frenagem','Pastilhas substituídas e fluido renovado','Concluída'),
(3,16,'2026-08-21 09:30:00','2026-08-21 11:00:00',50700,'Luz da injeção acesa','Falha intermitente identificada e apagada após diagnóstico','Concluída'),
(10,19,'2026-09-15 08:15:00','2026-09-15 16:00:00',103900,'Revisão preventiva da frota','Manutenção periódica','Concluída'),
(13,20,'2026-09-22 09:00:00','2026-09-22 12:30:00',28100,'Baixo fluxo de ar no sistema de ventilação','Filtro de cabine substituído','Concluída'),
(6,NULL,'2026-09-29 07:55:00',NULL,44300,'Ruído na dianteira ao passar por lombadas','Veículo aguardando diagnóstico completo','Em diagnóstico'),
(11,NULL,'2026-09-29 08:30:00',NULL,117800,'Motor apresenta oscilação em marcha lenta','Aguardando inspeção eletrônica','Aberta');

-- ============================================================
-- DADOS: os_servico
-- ============================================================

INSERT INTO os_servico
(id_os, id_servico, quantidade, valor_unitario, observacao)
VALUES
(1,1,1,80.00,NULL),
(1,2,1,120.00,NULL),

(2,4,1,180.00,NULL),
(2,5,1,150.00,'Valor promocional de mão de obra'),

(3,6,1,450.00,NULL),
(3,9,1,150.00,'Diagnóstico complementar'),

(4,15,1,500.00,NULL),
(4,17,1,50.00,NULL),
(4,18,1,90.00,NULL),

(5,9,1,150.00,NULL),
(5,12,1,70.00,NULL),

(6,11,1,120.00,NULL),
(6,17,1,50.00,NULL),
(6,18,1,90.00,NULL),

(7,4,1,180.00,NULL),
(7,5,1,250.00,NULL),

(8,9,1,120.00,'Diagnóstico com desconto'),
(8,20,1,180.00,NULL),

(9,14,1,750.00,NULL),
(9,9,1,150.00,NULL),

(10,16,1,180.00,NULL),
(10,17,1,50.00,NULL),
(10,18,1,90.00,NULL),

(11,7,1,220.00,NULL),

(12,15,1,500.00,NULL),
(12,9,1,150.00,NULL),

(13,4,1,180.00,NULL),
(13,9,1,120.00,NULL),

(14,9,1,150.00,NULL),

(15,15,1,500.00,NULL),

(16,16,1,180.00,NULL),

(17,7,1,220.00,NULL),
(18,9,1,150.00,NULL);

-- ============================================================
-- DADOS: os_peca
-- ============================================================

INSERT INTO os_peca
(id_os, id_peca, quantidade, valor_unitario)
VALUES
(1,1,1,38.90),
(1,2,4,52.00),

(2,3,2,189.90),
(2,4,2,179.50),

(3,5,1,210.00),
(3,6,1,175.00),

(4,1,1,38.90),
(4,2,4,52.00),
(4,11,1,55.00),
(4,12,1,56.00),

(5,10,1,510.00),

(6,9,4,42.50),
(6,11,1,55.00),
(6,12,1,60.00),

(7,3,2,190.00),
(7,4,2,340.00),

(8,16,1,135.00),
(8,17,2,47.50),

(9,15,1,890.00),

(10,11,1,55.00),
(10,12,1,68.00),
(10,25,1,72.00),

(11,21,2,85.00),
(11,22,1,130.00),
(11,23,1,115.00),

(12,1,1,38.90),
(12,2,4,52.00),
(12,11,1,55.00),
(12,12,1,68.00),
(12,13,2,39.90),
(12,19,1,32.00),

(13,3,2,189.90),
(13,14,1,34.90),

(15,1,1,38.90),
(15,2,4,52.00),
(15,11,1,55.00),
(15,12,1,68.00),
(15,13,1,39.00),
(15,19,1,32.00),

(16,25,1,72.00);

-- ============================================================
-- DADOS: faturamento
-- ============================================================

INSERT INTO faturamento
(id_os, data_faturamento, valor_total, forma_pagamento, status_pagamento, observacao)
VALUES
(1,'2026-01-13 11:30:00',446.90,'PIX','Pago',NULL),
(2,'2026-01-21 16:40:00',1068.80,'Cartão de Crédito','Pago','Parcelado em 3x'),
(3,'2026-02-05 10:15:00',985.00,'Cartão de Débito','Pago',NULL),
(4,'2026-03-03 17:40:00',1007.90,'PIX','Pago',NULL),
(5,'2026-03-20 12:20:00',780.00,'Cartão de Crédito','Pago','Parcelado em 2x'),
(6,'2026-04-02 14:10:00',615.00,'PIX','Pago',NULL),
(7,'2026-04-20 11:45:00',1510.00,'Cartão de Crédito','Pago','Parcelado em 4x'),
(8,'2026-05-07 14:00:00',530.00,'Dinheiro','Pago',NULL),
(9,'2026-06-06 16:20:00',1790.00,'Cartão de Crédito','Pago','Parcelado em 5x'),
(10,'2026-06-19 15:30:00',487.00,'PIX','Pago',NULL),
(11,'2026-07-04 16:00:00',550.00,'Cartão de Débito','Pago',NULL),
(12,'2026-07-17 11:15:00',1126.90,'Cartão de Crédito','Pago','Parcelado em 3x'),
(13,'2026-08-09 13:10:00',679.80,'PIX','Pago',NULL),
(14,'2026-08-21 11:15:00',150.00,'Dinheiro','Pago',NULL),
(15,'2026-09-15 16:15:00',786.00,'Boleto','Pendente','Prazo de 15 dias para pagamento'),
(16,'2026-09-22 12:45:00',252.00,'PIX','Pago',NULL);

-- ============================================================
-- VIEWS ÚTEIS
-- ============================================================

CREATE OR REPLACE VIEW vw_historico_veiculo AS
SELECT
    v.id_veiculo,
    v.placa,
    v.marca,
    v.modelo,
    c.nome AS cliente,
    os.id_os,
    os.data_abertura,
    os.data_fechamento,
    os.quilometragem_entrada,
    os.defeito_relatado,
    os.status
FROM veiculo v
JOIN cliente c ON c.id_cliente = v.id_cliente
LEFT JOIN ordem_servico os ON os.id_veiculo = v.id_veiculo;

CREATE OR REPLACE VIEW vw_total_os AS
SELECT
    os.id_os,
    os.id_veiculo,
    COALESCE((
        SELECT SUM(oss.subtotal)
        FROM os_servico oss
        WHERE oss.id_os = os.id_os
    ),0) AS total_servicos,
    COALESCE((
        SELECT SUM(osp.subtotal)
        FROM os_peca osp
        WHERE osp.id_os = os.id_os
    ),0) AS total_pecas,
    COALESCE((
        SELECT SUM(oss.subtotal)
        FROM os_servico oss
        WHERE oss.id_os = os.id_os
    ),0)
    +
    COALESCE((
        SELECT SUM(osp.subtotal)
        FROM os_peca osp
        WHERE osp.id_os = os.id_os
    ),0) AS total_geral
FROM ordem_servico os;

CREATE OR REPLACE VIEW vw_estoque_baixo AS
SELECT
    id_peca,
    descricao,
    fabricante,
    quantidade_estoque,
    estoque_minimo
FROM peca
WHERE quantidade_estoque <= estoque_minimo;

-- ============================================================
-- CONSULTAS DE TESTE / EXEMPLOS
-- ============================================================

-- 1. Listar clientes e seus veículos
SELECT
    c.nome,
    v.placa,
    v.marca,
    v.modelo,
    v.ano
FROM cliente c
JOIN veiculo v ON v.id_cliente = c.id_cliente
ORDER BY c.nome, v.placa;

-- 2. Histórico de manutenção de um veículo pela placa
SELECT *
FROM vw_historico_veiculo
WHERE placa = 'ABC1D23'
ORDER BY data_abertura DESC;

-- 3. Total calculado por ordem de serviço
SELECT *
FROM vw_total_os
ORDER BY id_os;

-- 4. Peças utilizadas em cada ordem de serviço
SELECT
    os.id_os,
    v.placa,
    p.descricao AS peca,
    op.quantidade,
    op.valor_unitario,
    op.subtotal
FROM os_peca op
JOIN ordem_servico os ON os.id_os = op.id_os
JOIN veiculo v ON v.id_veiculo = os.id_veiculo
JOIN peca p ON p.id_peca = op.id_peca
ORDER BY os.id_os, p.descricao;

-- 5. Serviços realizados em cada ordem de serviço
SELECT
    os.id_os,
    v.placa,
    s.descricao AS servico,
    oss.quantidade,
    oss.valor_unitario,
    oss.subtotal
FROM os_servico oss
JOIN ordem_servico os ON os.id_os = oss.id_os
JOIN veiculo v ON v.id_veiculo = os.id_veiculo
JOIN servico s ON s.id_servico = oss.id_servico
ORDER BY os.id_os, s.descricao;

-- 6. Faturamentos pendentes
SELECT
    f.id_faturamento,
    f.id_os,
    c.nome AS cliente,
    v.placa,
    f.valor_total,
    f.forma_pagamento,
    f.status_pagamento
FROM faturamento f
JOIN ordem_servico os ON os.id_os = f.id_os
JOIN veiculo v ON v.id_veiculo = os.id_veiculo
JOIN cliente c ON c.id_cliente = v.id_cliente
WHERE f.status_pagamento = 'Pendente';

-- 7. Orçamentos que não geraram ordem de serviço
SELECT
    o.id_orcamento,
    c.nome AS cliente,
    v.placa,
    o.data_orcamento,
    o.valor_total,
    o.status
FROM orcamento o
JOIN veiculo v ON v.id_veiculo = o.id_veiculo
JOIN cliente c ON c.id_cliente = v.id_cliente
LEFT JOIN ordem_servico os ON os.id_orcamento = o.id_orcamento
WHERE os.id_os IS NULL
ORDER BY o.data_orcamento;

-- 8. Peças com estoque baixo
SELECT *
FROM vw_estoque_baixo;

-- 9. Receita total por forma de pagamento
SELECT
    forma_pagamento,
    COUNT(*) AS quantidade_faturamentos,
    SUM(valor_total) AS valor_total
FROM faturamento
WHERE status_pagamento = 'Pago'
GROUP BY forma_pagamento
ORDER BY valor_total DESC;

-- 10. Clientes com maior quantidade de ordens de serviço
SELECT
    c.id_cliente,
    c.nome,
    COUNT(os.id_os) AS quantidade_os
FROM cliente c
JOIN veiculo v ON v.id_cliente = c.id_cliente
JOIN ordem_servico os ON os.id_veiculo = v.id_veiculo
GROUP BY c.id_cliente, c.nome
ORDER BY quantidade_os DESC, c.nome;

-- ============================================================
-- FIM DO SCRIPT
-- ============================================================


-- ===================================================== 
-- EXERCÍCIO 1 – INNER JOIN 
-- =====================================================

select os.id_os as "Ordem serviço",c.nome as "Cliente", v.placa as "Placa", v.marca as "Marca", v.modelo as "Modelo", os.data_abertura as "Data Abertura", os.status as "Situação"  from ordem_servico os
inner join veiculo v on v.id_veiculo =  os.id_veiculo
inner join cliente c on c.id_cliente = v.id_cliente
order by data_abertura desc;

-- ===================================================== 
-- EXERCÍCIO 2 – HAVING 
-- =====================================================
select c.nome as "Cliente", count(os.id_os) as "Quantidade ordens serviço" from cliente c
inner join veiculo v on v.id_cliente=c.id_cliente
inner join ordem_servico os on os.id_veiculo = v.id_veiculo
group by c.nome, c.nome
having count(os.id_os) >= 2
order by count(os.id_os) desc;

-- ===================================================== 
-- EXERCÍCIO 3 – PROCEDURE 
-- =====================================================
delimiter $$
	create procedure sp_historico_veiculo(in p_placa VARCHAR(10)) 
    BEGIN     
		SELECT v.placa AS 'Placa',   
			v.marca AS 'Marca',         
			v.modelo AS 'Modelo',         
			os.id_os AS 'Número da OS',         
			os.data_abertura AS 'Data de Abertura',         
			os.quilometragem_entrada AS 'Quilometragem de Entrada',         
			os.defeito_relatado AS 'Defeito Relatado',         
			os.status AS 'Status da Ordem'     
		FROM veiculo v     
		INNER JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo     
		WHERE v.placa = p_placa     
		ORDER BY os.data_abertura DESC; 
    END $$
delimiter ;

-- ===================================================== 
-- EXERCÍCIO 4 – TRIGGER 
-- =====================================================
DELIMITER $$
CREATE TRIGGER trg_baixar_estoque_peca 
AFTER INSERT ON os_peca 
FOR EACH ROW 
BEGIN
    UPDATE peca 
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE id_peca = NEW.id_peca;
END $$
DELIMITER ;

-- ===================================================== 
-- EXERCÍCIO 5 – FUNCTION 
-- =====================================================
DELIMITER $$
CREATE FUNCTION fn_total_ordem_servico(p_id_os INT) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total_servicos DECIMAL(12,2) DEFAULT 0.00;
    DECLARE v_total_pecas DECIMAL(12,2) DEFAULT 0.00;
    DECLARE v_total_geral DECIMAL(12,2) DEFAULT 0.00;
    SELECT IFNULL(SUM(subtotal), 0.00) INTO v_total_servicos
    FROM os_servico
    WHERE id_os = p_id_os;
    SELECT IFNULL(SUM(subtotal), 0.00) INTO v_total_pecas
    FROM os_peca
    WHERE id_os = p_id_os;
    SET v_total_geral = v_total_servicos + v_total_pecas;
    RETURN v_total_geral;
END $$
DELIMITER ;

-- ===================================================== 
-- EXERCÍCIO 6 – CONSULTA 
-- =====================================================
SELECT 
    os.id_os AS 'Número da OS', c.nome AS 'Cliente', v.placa AS 'Placa', os.data_abertura AS 'Data de Abertura', os.status AS 'Status', fn_total_ordem_servico(os.id_os) AS 'Valor Total'
FROM ordem_servico os
INNER JOIN veiculo v ON os.id_veiculo = v.id_veiculo
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
WHERE os.status = 'Concluída'
ORDER BY fn_total_ordem_servico(os.id_os) DESC;

-- ===================================================== 
-- EXERCÍCIO 7 – ADICIONAL 
-- =====================================================
SELECT 
    c.nome AS 'Cliente',
    v.placa AS 'Placa',
    v.marca AS 'Marca',
    v.modelo AS 'Modelo',
    COUNT(os.id_os) AS 'Quantidade',
    SUM(f.valor_total) AS 'Valor Total'
FROM cliente c
INNER JOIN veiculo v ON c.id_cliente = v.id_cliente
INNER JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo
INNER JOIN faturamento f ON os.id_os = f.id_os
GROUP BY c.id_cliente, c.nome, v.id_veiculo, v.placa, v.marca, v.modelo
HAVING SUM(f.valor_total) > 1000.00
ORDER BY SUM(f.valor_total) DESC;