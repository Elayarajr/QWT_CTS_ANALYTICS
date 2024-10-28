{{ config(materialized='incremental', unique_key=['orderid', 'Lineno']) }}

select od.* from 

  {{source('qwt_raw', 'orders') }} as o inner join

    {{source('qwt_raw', 'ordersdetails') }} as od 
    on   o.orderid=od.orderid

    (if is incremental())

    --this filter will only be applied on an incremental run
where o.orderdate(select max(orderdate) from {{ ref('stg_orders') }})(endif %)
