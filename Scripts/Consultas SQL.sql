/* Existem quantos conjuntos no dataset? */	
select count(distinct(num_conjunto)) from conjuntos;

/* Quantos temas existem? */	
select count(id) as Temas from temas;

/* Quantas cores existem? */
select count(distinct(id)) from cores;

/* Qual é o total de peças únicas? */
select count(distinct(num_peca)) from pecas; 

/* Quantas categorias de peças existem? */	
select count(id) as Categorias from pecas_categorias;

/* Quantos conjuntos foram lançados durante os anos?*/
select ano, count(num_conjunto) as conjuntos
from conjuntos
group by ano
order by ano;

/* Qual são os maiores conjuntos? */
select nome as Conjuntos, sum(qtd_pecas) as Peças from conjuntos
group by Conjuntos
order by Peças desc
limit 10;

/* Qual categoria possui mais peças? */	
select pecas_categorias.nome as Categorias, count(pecas.num_peca) 
from pecas_categorias left join pecas 
on pecas_categorias.id = pecas.peca_categoria_id 
group by Categorias 
order by count(pecas.num_peca) desc
limit 10;

/* Qual a média de peças nos conjuntos durante os anos? */	
select ano, avg(qtd_pecas) as 'Média de Peças' from conjuntos
group by ano
order by ano;

/* Quais são as cores mais utilizadas nas peças */	
select nome as Cores, count(distinct(num_peca)) as 'Peças Únicas'
from cores join inventario_peca
on cores.id = inventario_peca.cor_id
where nome <> '[No Color]'
group by Cores
order by count(distinct(num_peca)) desc
limit 10;

/* Qual é o n° de cores transparentes e não transparentes */
select count(id) as 'Cores Não Transparentes' from cores
where transparente = 'f';
select count(id) as 'Cores Transparentes' from cores
where transparente = 't';

/* Quais são os temas mais usados? */
select temas.nome as Temas, count(num_conjunto)
from temas join conjuntos
on temas.id = conjuntos.tema_id
group by Temas
order by count(num_conjunto) desc
limit 10;