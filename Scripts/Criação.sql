CREATE DATABASE lego;

USE lego;

CREATE TABLE IF NOT EXISTS temas (
  id INT NOT NULL,
  nome VARCHAR(100),
  parent_id INT,
  PRIMARY KEY (id)
  );
  
CREATE TABLE IF NOT EXISTS conjuntos (
  num_conjunto VARCHAR(45) NOT NULL,
  nome VARCHAR(100),
  ano YEAR,
  tema_id INT NOT NULL,
  qtd_pecas INT,
  PRIMARY KEY (num_conjunto),
  FOREIGN KEY (tema_id) REFERENCES temas (`id`)
  );
  
CREATE TABLE IF NOT EXISTS inventario (
  id INT NOT NULL,
  versao INT NULL,
  num_conjunto VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (num_conjunto) REFERENCES conjuntos (num_conjunto)
  );
  
  CREATE TABLE IF NOT EXISTS inventario_conjunto (
  inventario_id INT NOT NULL,
  num_conjunto VARCHAR(45) NOT NULL,
  quantidade INT NULL,
  PRIMARY KEY (inventario_id, num_conjunto),
  FOREIGN KEY (inventario_id) REFERENCES inventario (id),
  FOREIGN KEY (num_conjunto) REFERENCES conjuntos (num_conjunto)
  );
  
  CREATE TABLE IF NOT EXISTS pecas_categorias (
  id INT NOT NULL,
  nome VARCHAR(200),
  PRIMARY KEY (id));
  
  CREATE TABLE IF NOT EXISTS pecas (
  num_peca VARCHAR(45) NOT NULL,
  nome VARCHAR(250),
  peca_categoria_id INT NOT NULL,
  PRIMARY KEY (num_peca),
  FOREIGN KEY (peca_categoria_id) REFERENCES pecas_categorias (id)
  );
  
  CREATE TABLE IF NOT EXISTS cores (
  id INT NOT NULL,
  nome VARCHAR(100),
  rgb VARCHAR(45),
  transparente VARCHAR(1),
  PRIMARY KEY (id)
  );
  
  CREATE TABLE IF NOT EXISTS inventario_peca (
  inventario_id INT,
  num_peca VARCHAR(45),  
  cor_id INT NOT NULL,
  quantidade INT NULL,
  sobressalente VARCHAR(1) NULL,
  FOREIGN KEY (num_peca) REFERENCES pecas (num_peca),
  FOREIGN KEY (inventario_id) REFERENCES inventario (id),
  FOREIGN KEY (cor_id) REFERENCES cores (id)
  );
