/* Alterar o caminho onde se encontram os arquivos CSV em "LOAD DATA INFILE" */

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/themes.csv"
INTO TABLE temas
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, nome, @vparent_id)
SET parent_id = NULLIF(@vparent_id,'');

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/sets.csv"
INTO TABLE conjuntos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/inventories.csv"
INTO TABLE inventario
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/inventory_sets.csv"
INTO TABLE inventario_conjunto
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/part_categories.csv"
INTO TABLE pecas_categorias
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/parts.csv"
INTO TABLE pecas
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/colors.csv"
INTO TABLE cores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/Users/PICHAU/Desktop/LEGO Database/inventory_parts.csv"
INTO TABLE inventario_peca
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;