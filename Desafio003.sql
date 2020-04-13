select Distinct C.nome, c.idcliente, c.uf, c.celular 
from cliente c with(nolock)
inner join financiamento f  with(nolock) on f.idcliente =  c.idcliente
inner join Parcelas p  with(nolock) on p.IdFinanciamento =  f.idfinanciamento
where p.datavencimento + 10 > p.DataPagamento and f.valorTotal > 10000

