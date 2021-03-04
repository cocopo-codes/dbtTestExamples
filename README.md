## Welcome to the dbtTestExamples project!

### About This dbt Model Project
This dbt model is based on the premise that three kids are playing a video game that involves game statistics. The model pulls from sources, transforms them into the stage folder, and then creates a "Statistics" view in the final output stage.

Overall it has some simple dbt models along with related tests. Its purpose is to provide users with some quick examples of dbt schema and data tests. 

**Note:** This project uses BigQuery to contain the dbt project's data, so the instructions are specific to BigQuery database configuration.

### Before Running the Project (Prerequisites)
- In order to create this dbt model, you will want to **install [dbt](https://docs.getdbt.com/docs/introduction)** before you clone this repository

- This project requires the **setup of a PostgreSQL BigQuery server** where you will be able to run these seeds, models and tests. I used [this guide](https://cloud.google.com/sql/docs/postgres/create-instance#create-2nd-gen) to set up my PostgreSQL container on BigQuery with dbt.

- The project has **custom configuration instructions for the dbt profiles.yml file**, which is covered in [dbt documentation](https://docs.getdbt.com/reference/profiles.yml/) if the tutorial isn't enough.

### How to Run the Project
#### Step 1.
Create a Big Query project (Referenced above), and subsequently a PostgreSQL Resource inside the project. 

To run this project, you'll need the following from your Big Query SQL instance: 
- The instance connection name (usually something like "jenny-cassette-8675309"), called "project" in profiles.yml
- The Service Account JSON key for your specific project (a downloadable JSON key you'll reference), called a "keyfile" in profiles.yml
- The dataset (schema) name

#### Step 2.
Clone this repo to your machine. 

Bring your Big Query values into profiles.yml (local under the hidden .dbt/ folder) and the project's [sources.yml](https://github.com/corissawex/dbtTestExamples/blob/86d41367884fa8d27383f099e0132b7f730b9ba4/models/1-source/sources.yml#L6).

Sources.yml is quick; follow the comments and enter the database name (instance connection name) and the schema (dataset) name.

Profiles.yml is a little more complex so you should just copy and paste the below profile, then enter the right values for your Big Query keyfile and project.

       dbt_example_db:
          outputs: 
            dev: 
            type: bigquery
            method: service-account
            project: INSTANCE-CONNECTION-NAME
            dataset: postgres
            threads: 25
            keyfile: /users/User/development/MY-KEY-FILE-FROM-BIG-QUERY.json
            timeout_seconds: 180
          target: dev

The name of this profile will match the dbt_project file and connect to your server instance.

#### Step 3. 
Once all your connections are put together for Big Query, you can compile the project by going to bash and moving into the dbtTestExamples directory wherever you cloned this project. From there, try: 

    dbt seed
    
You should see successful messages like "OK loaded seed file postgres.games_users". 

This builds the source tables for the dbt models to run. If this works, you know you're connected to your Big Query instance and that dbt is running successfully. 

Now use:

    dbt run
    
This should also succeed without any error.

#### Step 4. 
Now you can run the tests! 

There are a few ways to do this. If you want to run everything, use: 

    dbt test
    
Alternatively, you can choose to run just schema or data tests using these commands: 

    dbt test --data
    
    dbt test --schema
    
Or, run all tests for a specific model: 

    dbt test --models statistics

### I already know dbt, can I just jump in? 
Sure! Just be sure to connect Big Query to this dbt project after you've cloned it, and reconfigure any custom changes.

This project does include the use of dbt seeds which you can read about [here](https://docs.getdbt.com/docs/building-a-dbt-project/seeds/) if you're curious.

### dbt Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
