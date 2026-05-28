-- =============================================================
-- SEED DATA - Bazar
-- Famílias: 1E, 2E, 3E, 5E
-- Stock inicial via tabela movimento
-- =============================================================

-- FAMÍLIAS
INSERT OR IGNORE INTO familia (id, name) VALUES (1, '1E');
INSERT OR IGNORE INTO familia (id, name) VALUES (2, '2E');
INSERT OR IGNORE INTO familia (id, name) VALUES (3, '3E');
INSERT OR IGNORE INTO familia (id, name) VALUES (5, '5E');

-- =============================================================
-- ARTIGOS - Família 1E
-- =============================================================
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (100, 'Marmita com de rosa', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (101, 'Caneca Sporting', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (102, 'Frasco Grande', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (103, 'Conjunto frascos peq.', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (104, 'Copo Sporting', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (105, 'Taças de vidro', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (106, 'Conjunto talheres', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (107, 'Conjunto taças de vidro (3)', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (108, 'Conjunto taças de vidro (2)', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (109, 'Conjunto pratos fundos', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (110, 'Chavena conjunto com prato', 1);
-- 111 riscado, omitido
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (112, 'Pratos', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (113, 'Boneco advogado', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (114, 'Imagens', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (115, 'Aguçadeiro', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (116, 'Bonecos coração', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (117, 'Rolo de cozinha', 1);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (118, 'Bolas', 1);

-- =============================================================
-- ARTIGOS - Família 2E
-- =============================================================
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (200, 'Conjunto taças de Barro', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (201, 'Conjunto copos de whisky', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (202, 'Formas de Pudim', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (203, 'Pano de Loiça', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (204, 'Conjunto facas e descascador', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (205, 'Conjunto talheres infantil', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (206, 'Conjunto marmitas', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (207, 'Amolador de facas', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (208, 'Furador de amanuel', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (209, 'Beile', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (210, 'Conjunto chavena com prato', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (211, 'Conjunto de 2 chavenas com prato', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (212, 'Conjunto de 2 chavenas', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (213, 'Jarro', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (214, 'Imagem', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (215, 'Chavenas', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (216, 'Espremedor de laranja', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (217, 'Conjunto copos', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (218, 'Pratos', 2);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (219, 'Prato florido', 2);

-- =============================================================
-- ARTIGOS - Família 3E
-- =============================================================
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (300, 'Conjunto azeite e vinagre', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (301, 'Copos de vinho', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (302, 'Moldura', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (303, 'Conjunto copos e taças', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (304, 'Sanna azul', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (305, 'Pistola de água', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (306, 'Porta velas', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (307, 'Porta temperos', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (308, 'Taça grande', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (309, 'Aperitivos', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (310, 'Sanna', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (311, 'Frasco', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (312, 'Colar com bonecos', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (313, 'Bolhas de sabão', 3);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (314, 'Sanna de flores', 3);

-- =============================================================
-- ARTIGOS - Família 5E
-- =============================================================
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (500, 'Sanna', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (501, 'Pote de doces', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (502, 'Garrafa whiskey', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (503, 'Conjunto de copos', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (504, 'Copos de whisky', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (505, 'Prato de sobremesa', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (506, 'Bule', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (507, 'Imagem', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (508, 'Conjunto de taças', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (509, 'Conjunto de chavenas de café', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (510, 'Prato', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (511, 'Frascos', 5);
INSERT OR IGNORE INTO artigo (id, name, familia) VALUES (512, 'Conjunto chavenas', 5);

-- =============================================================
-- STOCK INICIAL - Movimentos (qtd positiva = entrada)
-- =============================================================

-- Família 1E
INSERT INTO movimento (artigo, descricao, qtd) VALUES (100, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (101, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (102, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (103, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (104, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (105, 'Stock inicial', 5);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (106, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (107, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (108, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (109, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (110, 'Stock inicial', 4);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (112, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (113, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (114, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (115, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (116, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (117, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (118, 'Stock inicial', 3);

-- Família 2E
INSERT INTO movimento (artigo, descricao, qtd) VALUES (200, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (201, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (202, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (203, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (204, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (205, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (206, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (207, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (208, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (209, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (210, 'Stock inicial', 8);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (211, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (212, 'Stock inicial', 4);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (213, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (214, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (215, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (216, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (217, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (218, 'Stock inicial', 6);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (219, 'Stock inicial', 1);

-- Família 3E
INSERT INTO movimento (artigo, descricao, qtd) VALUES (300, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (301, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (302, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (303, 'Stock inicial', 5);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (304, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (305, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (306, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (307, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (308, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (309, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (310, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (311, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (312, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (313, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (314, 'Stock inicial', 1);

-- Família 5E
INSERT INTO movimento (artigo, descricao, qtd) VALUES (500, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (501, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (502, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (503, 'Stock inicial', 3);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (504, 'Stock inicial', 2);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (505, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (506, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (507, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (508, 'Stock inicial', 4);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (509, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (510, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (511, 'Stock inicial', 1);
INSERT INTO movimento (artigo, descricao, qtd) VALUES (512, 'Stock inicial', 1);
