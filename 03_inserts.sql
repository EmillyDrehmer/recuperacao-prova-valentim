insert into departamentos(id_departamento,nome_depar,local_depar) 
VALUES
("1","Produçao","Bloco A"),
("2","Engenharia","Bloco B"),
("3","Qualidade","Bloco C"),
("4","Logística","Bloco D"),
("5","Tecnologia da Informação","Bloco E");

insert into colaboradores(id_col,nome_col,cpf_col,email_col,cargo_col,data_adm_col,telefone_col,id_dep_col) 
VALUES
("1","Ana","121.121.122.12", "ana@gmail.com", "Produção", "2025-12-14","4794563-2584",1),
("2","Maria","125.121.121.12", "maria@gmail.com", "Manutenção", "2021-12-15","4799563-2584",2),
("3","Julia","121.141.161.12", "ju@gmail.com", "Produção", "2022-10-17","4799563-2684",3),
("4","Erick","121.121.141.12", "bueno@gmail.com", "Fiscal", "2023-08-13","4799863-2584",4),
("5","João","123.121.121.12", "joao@gmail.com", "RH", "2020-11-12","4799523-2584",5);


insert into equipamentos(id_equip,patrimonio_equip,descricao_equip,fabricante_equip,modelo_equip,data_aqui_equip,status_equip,id_cat_equip,id_col_equip)
VALUES
("1","123","Computador do setor de RH", "Samsung","Computador b2",'2024-12-23','Funcionando', '1','4'),
("2","143","Notebook do setor de Manutenção", "Motorola","Notebook b2",'2025-12-11','Funcionando', '2','3'),
("3","113","Impressora do setor de RH", "Oppo","Impressora b2",'2024-11-07','Funcionando', '3','2');


insert into categoria_equip( id_categoria, nome_cat)
VALUES
("1", "Computação"),
("2", "Rede"),
("3", "Impressão"),
("4", "Mobilidade");

insert into fornecedores(id_fornecedor, razao_soc_for, cnpj_for, telefone_for, cidade_for, email_for, id_equip_for)
VALUES
("1","Jorginho ltda","15.148.256","4599541236547","Blumenau","jorginho@gmail.com","1"),
("2","Lia ltda","15.168.256/192","4599541436547","Joivile","lia@gmail.com","2"),
("3","Julia ltda","15.148.556/192","4599545236547","Corupa","ju@gmail.com","3");


insert into chamado(id_chamado, data_chamado, descricao_chamado, prioridade_chamado, status_chamado, data_enc_chamado,
id_col_chamado, id_equip_chamado)
VALUES
("1","2020-12-21","Maquina quebrada","Urgente","Finalizado","2020-12-22","4","3"),
("2","2025-09-15","Impressora quebrada","Urgente","Em processo","2026-06-22","3","2"),
("3","2023-10-17","Notebook quebrada","Pouco urgente","Em processo","2026-06-28","1","1");

insert into manutencao(id_manut, data_manut, desc_manut,tempo_manut, custo_manut, id_col_manut, id_chama_manut)
VALUES
("1","2020-12-14", "Concerto de impressora", "14:20", "200.30",'4',"1"),
("2","2024-10-24", "Concerto de notbook", "10:26", "20.50",'2',"2"),
("3","2025-06-18", "Concerto de impressora", "4:20", "2000.30",'1',"3");

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

