## Welcome to the dbtTestExamples project!

### About This dbt Model Project
This dbt model is based on the premise that three kids are playing a video game that involves game statistics. The model pulls from sources, transforms them into the stage folder, and then creates a "Statistics" view in the final output stage.

Overall it has some simple dbt models along with related tests. Its purpose is to provide users with some quick examples of dbt schema and data tests. 

**Note:** This project uses Snowflake to contain the dbt project's data, so the instructions are specific to Snowflake database configuration.

### Before Running the Project (Prerequisites)
- In order to create this dbt model, you will want to **install [dbt](https://docs.getdbt.com/docs/introduction)** (data build tool) before you clone this repository

- This project requires the **setup of a Snowflake server** where you will be able to run these seeds, models and tests. 

- The project has **custom configuration instructions for the dbt profiles.yml file**, which is covered in [dbt documentation](https://docs.getdbt.com/reference/profiles.yml/) if the tutorial isn't enough.

### How to Run the Project
#### Step 1.
Create a Snowflake instance, and subsequently warehouse in that instance. 

To run this project, you'll need the following from your Snowflake instance: 
- The prefix on your Snowflake instance URL including the type of instance you chose (like "wer5e43.us-east-1" for AWS East), called "account" in profiles.yml
- The database, warehouse, and schema name (try to generate a Snowflake instance using the information below in the profiles.yml example.

#### Step 2.
Clone this repo to your machine. 

Bring your Snowflake values into profiles.yml (local under the hidden .dbt/ folder) and the project's [sources.yml](https://github.com/corissawex/dbtTestExamples/blob/86d41367884fa8d27383f099e0132b7f730b9ba4/models/1-source/sources.yml#L6).

Profiles.yml is a little more complex so you should just copy and paste the below profile, then enter the right values for your Snowflake project.
```
dbt_example_db:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: aaa777777.us-east-1
      # User/password auth
      user: your_user 
      password: "password"
      role: DBTTESTEXAMPLES_ROLE
      database: DBTTESTEXAMPLES_DATABASE
      warehouse: DBTTESTEXAMPLES_WAREHOUSE
      schema: DBTTESTEXAMPLES_SCHEMA
      threads: 1
```
The name of this profile will match the dbt_project file and connect to your server instance.

#### Step 3. 
Once all your connections are put together for Snowflake, you can compile the project by going to bash and moving into the dbtTestExamples directory wherever you cloned this project. From there, try: 

    dbt seed
    
You should see successful messages like "OK loaded seed file games_users". 

This builds the source tables for the dbt models to run. If this works, you know you're connected to your Snowflake instance and that dbt is running successfully. 

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
Sure! Just be sure to connect Snowflake to this dbt project after you've cloned it, and reconfigure any custom changes.

This project does include the use of dbt seeds which you can read about [here](https://docs.getdbt.com/docs/building-a-dbt-project/seeds/) if you're curious.

### dbt Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
