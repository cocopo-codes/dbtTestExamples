Welcome to the dbtTestExamples project!

### Introduction and Critical Setup Notes
- This project has some simple dbt models along with related tests. Its purpose is to provide users with some quick examples of dbt schema and data tests. 
- This does require an installation of a BigQuery server where you will be able to generate your models. I used [this great tutorial](https://dataschool.com/sql-optimization/start-modeling-data/) to set up my container on BigQuery with dbt
- This also requires custom configuration in the profiles.yml file for dbt and BigQuery, which is also covered in [some dbt documentation](https://docs.getdbt.com/reference/profiles.yml/) if the above tutorial isn't enough
- This project does include the use of dbt seeds which you can read about [here](https://docs.getdbt.com/docs/building-a-dbt-project/seeds/)

If you know what you're doing and you just want to mess about after you've installed dbt, set up BigQuery, cloned this repo, and adjusted your profiles.yml file, try running the following commands:
- dbt debug
- dbt seed (must be run before dbt run) 
- dbt compile
- dbt run
- dbt test

### How to Run the Project
#### Step 1.

#### Step 2. 

#### Step 3. 

#### Step 4. 

### dbt Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
