

SELECT c.idcliente,f.IdFinanciamento FROM dbo.Cliente C
INNER JOIN Financiamento F ON F.IdCliente = C.IdCliente
INNER JOIN dbo.Parcelas P ON P.IdFinanciamento = F.IdFinanciamento
WHERE c.uf = 'SP'and 
(
(select Count(0) from Parcelas p1
where DataPagamento is not null and p1.IdFinanciamento = f.IdFinanciamento
group by idfinanciamento ) 

*100/ 

(select Count(0) from Parcelas p2
where p2.IdFinanciamento = f.IdFinanciamento
group by idfinanciamento )
) > 60

group by c.IdCliente,f.IdFinanciamento 