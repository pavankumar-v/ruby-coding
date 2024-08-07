# Create SQL Database Adapter, that can communicate with any database client

# For Now Let's consider onyl MySQL, Postgresql & sqlite

=begin
Let's list down configurations for each
(usually called as "connection string")

1. MySQL
    - host
    - username
    - password
    - port
    - database
    - socket (path)

2. Postgresql
    - host
    - username
    - password
    - port
    - database
    - ssl ( ssl mode -> true/false )

3. sqlite
    - source ( path of db file Ex: path/to/<database_name>.db )
=end

# Now How do we create a adapter, that can take query and execute
# for the following database service that is required

=begin
Functional Requirements
1. Once Db adataper should give us instance of client
2. Query passed should show execute and output based on query
3. Display data in table format

Non Functional Requirements
1. Add validation to configuration
    - any required missing configuration
2. Shrow Error on Database Query Execution
=end


 