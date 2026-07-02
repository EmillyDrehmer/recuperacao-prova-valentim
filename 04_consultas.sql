#Liste todos os departamentos cadastrados na empresa.

select nome_depar
from departamentos;

#Liste o nome, cargo e e-mail corporativo de todos os colaboradores.

select nome_col,cargo_col, email_col
from colaboradores;

#Exiba o patrimônio, descrição e fabricante de todos os equipamentos cadastrados.

select patrimonio_equip, descricao_equip, fabricante_equip
from equipamentos;

#Exiba apenas a descrição e o status dos equipamentos.

select descricao_equip, status_equip
from equipamentos;

#Liste os colaboradores admitidos após uma determinada data informada pelo professor.

select id_col,nome_col
from colaboradores
where data_adm_col > '2020-01-01';

#Exiba todos os equipamentos cuja data de aquisição seja posterior a uma data informada pelo professor.

select id_equip
from equipamentos
where data_aqui_equip > '2020-01-01';

#Liste todos os fornecedores localizados em uma cidade específica.
select razao_soc_for
from fornecedores
where cidade_for = 'Blumenau';

#Exiba os equipamentos pertencentes a uma categoria informada pelo professor.

select id_equip
from equipamentos
where id_cat_equip = "3";

#Liste os colaboradores que ocupam um cargo informado pelo professor.

select nome_col
from colaboradores
where cargo_col = 'Fiscal';

#Exiba os fornecedores que possuem telefone cadastrado.

select id_fornecedor, razao_soc_for
from fornecedores 
where telefone_for is not null;

#Liste os equipamentos cuja descrição contenha uma palavra ou trecho informado pelo professor.

select id_equip 
from equipamentos
where descricao_equip like "%RH%";

#Exiba os chamados com status "Fechado".

select id_chamado
from chamado
where status_chamado = "Finalizado";

#Liste os chamados com prioridade "Alta".

select id_chamado 
from chamado
where prioridade_chamado = "Urgente";

#Exiba todos os equipamentos ordenados pela descrição em ordem alfabética.

select id_equip
from equipamentos
order by descricao_equip asc;

#Liste os equipamentos ordenados pela data de aquisição da mais recente para a mais antiga.

select *
from equipamentos
order by data_aqui_equip desc;

#Exiba a quantidade total de colaboradores cadastrados na empresa.

select count(id_col) as qtd_col
from colaboradores;

#Apresente a quantidade total de equipamentos cadastrados.

select count(id_equip) as qtd_equip
from equipamentos;

#Exiba a data mais antiga de admissão entre todos os colaboradores.


#Apresente a quantidade de equipamentos cadastrados em cada categoria.

select count(id_cat_equip) as qtd_equip_cat
from equipamentos
group by id_cat_equip;
#Exiba a quantidade de equipamentos cadastrados por fornecedor.

select count(id_equip_for) as qtd_equip_for
from fornecedores
group by id_fornecedor;

#Liste o nome dos colaboradores e o nome dos departamentos aos quais pertencem.

select nome_col, nome_depar
from departamentos d
join colaboradores c on d.id_departamento=c.id_dep_col
group by id_col, id_departamento;

#Exiba a descrição dos equipamentos juntamente com o nome de suas respectivas categorias.

select descricao_equip, nome_cat
from categoria_equip c 
join equipamentos e on c.id_categoria=e.id_cat_equip;

#Liste a descrição do equipamento, a razão social do fornecedor e o status do equipamento.

select descricao_equip, razao_soc_for, status_equip
from equipamentos e 
join fornecedores f on e.id_for_equip=f.id_fornecedor;

#Exiba o(s) equipamento(s) com a data de aquisição mais recente cadastrada no sistema.

select *
from equipamentos
order by data_aqui_equip desc;

#Liste os colaboradores cuja data de admissão seja superior à data média de admissão dos colaboradores cadastrados.



