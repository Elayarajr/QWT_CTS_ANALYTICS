{{ config ( materialized='table', schema= 'transforming') }}

select
    CustomerID,
CompanyName,
ContactName,
City,
Country,
DivisionID,
Address,
Fax,
Phone,
PostalCode,
iff(ltrim(rtrim(StateProvince)) ='','NA',StateProvince) as StateProvince

from {{ ref ('stg_customers') }}
