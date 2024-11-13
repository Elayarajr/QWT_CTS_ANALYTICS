select
 
OrderId,
 
sum(linesalesamount) as sales
 
from
 
{{ref('fct_orders')}}
 
group by OrderId