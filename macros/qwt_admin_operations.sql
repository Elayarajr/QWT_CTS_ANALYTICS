{% macro grant_select(role) %}
{% set sql %}
    grant usage on schema staging to role {{ role }};
    grant select on all tables in schema staging to role {{ role }};
    grant select on all views in schema staging to role {{ role }};
{% endset %}
 
{% do run_query(sql) %}
{% do log("Privileges granted", info=True) %}
{% endmacro %}
 
 