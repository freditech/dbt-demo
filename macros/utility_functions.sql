{% macro tbref(model_name_key, source_name, table_name) %}
  {#
    This is a custom macro that override the default 'ref' macro usage. Its 
    been developed to address the following needs:
      - Facilitate data testing with static datasets : https://discourse.getdbt.com/t/testing-with-fixed-data-set/564/5

      --dbt run -m +customer_nation_region_aggregate --target=citest --vars "{'customer_test': 'customer_data', 'nation_test': 'nation_data', 'region_test': 'region_data'}
  #}
 {% if target.name is not defined %}
    {{ return(source(source_name,table_name)) }}
  {% elif var is not defined %}
    {{ return(source(source_name,table_name)) }}
  {% endif %}

  {% if target.name == 'citest' and var(model_name_key) %}
    {{ log("Loading from reference : " ~ var(model_name_key),True) }}
    {{ return(var(model_name_key)) }}
  {% endif %}
  
  {{ log("Loading default model from source: " ~ source_name+"."+table_name,True) }}
  {{ return(source(source_name,table_name)) }}

{% endmacro %}