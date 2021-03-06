Welcome to your new dbt project!

### Using the starter project

### Compile:
- dbt clean
- dbt deps
- dbt compile

### Unit Testing based on sample data:
- dbt run-operation clone_schema --args "{'source_schema': 'RAW', 'destination_schema': 'ci_schema', 'source_database': 'POCDB', 'destination_database': 'POCDB'}"
- dbt seed --target=citest
- dbt test --models source:* --target=citest --vars "{'source_db':'POCDB', 'source_schema':'ci_schema'}"
- dbt run -m +customer_nation_region_aggregate --target=citest --vars "{'customer_test': 'customer', 'nation_test': 'nation', 'region_test': 'region'}
- dbt test -m expected_output --target=citest
- dbt test --target=citest --exclude source:* expected_output
- dbt run-operation drop_schema --args "{'schema_name': 'ci_schema', 'database': 'POCDB'}"

### For data validation against the actual data:
- dbt clean
- dbt deps
- dbt compile
- dbt test --models source:*
- dbt run
- dbt test --exclude source:* expected_output

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


