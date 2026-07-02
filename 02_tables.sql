create table departamentos(
id_departamento INT PRIMARY KEY AUTO_INCREMENT,
nome_depar VARCHAR (50) NOT NULL UNIQUE,
local_depar VARCHAR (50) NOT NULL
);

create table colaboradores(
id_col INT PRIMARY KEY AUTO_INCREMENT,
nome_col VARCHAR(50) NOT NULL,
cpf_col VARCHAR(14) NOT NULL UNIQUE,
email_col VARCHAR(100) UNIQUE,
cargo_col VARCHAR(50),
data_adm_col DATE NOT NULL,
telefone_col VARCHAR(15),
id_dep_col INT NOT NULL,
Foreign Key (id_dep_col) REFERENCES departamentos(id_departamento)
);

create table equipamentos(
id_equip INT PRIMARY KEY AUTO_INCREMENT,
patrimonio_equip VARCHAR(15) NOT NULL UNIQUE,
descricao_equip TEXT,
fabricante_equip VARCHAR(50) NOT NULL,
modelo_equip VARCHAR(50),
data_aqui_equip DATE NOT NULL,
status_equip ENUM ('Funcionando', 'Estragado', 'Em manutenção', 'Aguardando analise'),
id_cat_equip INT NOT NULL,
id_col_equip INT NOT NULL,
id_for_equip INT NOT NULL,
Foreign Key (id_cat_equip) REFERENCES categoria_equip(id_categoria),
Foreign Key (id_col_equip) REFERENCES colaboradores(id_col)
);

create table categoria_equip(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_cat VARCHAR(50)
);

create table fornecedores(
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
razao_soc_for VARCHAR(50) NOT NULL,
cnpj_for VARCHAR(15) NOT NULL UNIQUE,
telefone_for VARCHAR(15),
cidade_for VARCHAR(20) NOT NULL,
email_for VARCHAR(100),
id_equip_for INT NOT NULL UNIQUE,
Foreign Key (id_equip_for) REFERENCES equipamentos(id_equip)
);

create table chamado(
id_chamado INT PRIMARY KEY AUTO_INCREMENT,
data_chamado DATE NOT NULL,
descricao_chamado TEXT,
prioridade_chamado ENUM ('Urgente', 'Pouco urgente', 'Urgencia maxima'),
status_chamado ENUM ('Em analise', 'Em processo', 'Finalizado'),
data_enc_chamado DATE NOT NULL,
id_col_chamado INT NOT NULL,
id_equip_chamado INT NOT NULL,
Foreign Key (id_col_chamado) REFERENCES colaboradores(id_col),
Foreign Key (id_equip_chamado) REFERENCES equipamentos(id_equip)
);

create table manutencao(
id_manut INT PRIMARY KEY AUTO_INCREMENT,
data_manut DATE NOT NULL,
desc_manut TEXT,
tempo_manut TIME NOT NULL,
custo_manut DECIMAL(10,2),
id_col_manut INT NOT NULL UNIQUE,
id_chama_manut INT NOT NULL UNIQUE,
Foreign Key (id_chama_manut) REFERENCES chamado(id_chamado),
Foreign Key (id_col_manut) REFERENCES colaboradores(id_col)
);