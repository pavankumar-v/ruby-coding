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
1. The adapter should support [MySQL, Postgresql & sqlite]
2. Once Db adataper should give us instance of client
3. Query passed should show execute and output based on query
4. Display data in table format

Non Functional Requirements
1. Add validation to configuration
    - any required missing configuration
2. Shrow Error on Database Query Execution
=end

# Planning
=begin
We Require 5 Classes based on our requirements
1. Interface Class (Abstract Pattern)
    -> This is more like making the implementation of classes strict
    -> it any class that will inherit, should implement those methods or else, it throws error
2. Adapter Class
    -> creates instance of adaptee (yes adapteee!)
    -> creates connection object
3. MySQL, Postgresql, sqlite Classes
    -> implements basic methods like query and connect
=end