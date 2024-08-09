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

class MySQL
    def initialize(host: "127.0.0.1", username:, password:, port: 3306, database: nil, socket: nil)
        @host = host
        @username = username
        @password = password
        @port = port
        @database = database
        @socket = socket
        @conn = nil
        @query = ""
    end

    def query(query_str)
        puts query_str
    end

    def execute
        # executes query
        puts "executed query"
    end

    def conn
        raise StandardError.new("Connection Failed") if !valid_conn?
        @conn ||= {connected_object: "connected", client: "mysql"}
    end

    private
        def valid_conn?
            return true if @host && @username && @password && @port
            false
        end

        def sanitized_query
        end
end

class Postgresql
    def initialize(host: "127.0.0.1", username:, password:, port: 5432, database: nil, ssl: false) 
        @host = host
        @username = username
        @password = password
        @port = port
        @database = database
        @ssl = ssl
        @conn = nil
        @query = ""
    end

    def query(query_str)
        @query = query_str
        @query = sanitized_query
    end

    def execute
        # executes query
        puts "executed query"
    end

    def conn
        raise StandardError.new("Connection Failed") if !valid_conn?
        @conn ||= {connected_object: "connected", client: "postges"}
    end
    private

        def valid_conn?
            return true if @host && @username && @password && @port
            false
        end

        def sanitized_query
            # runs some tasks to sanitize the query
            return @query
        end
end

class Database
    def initialize(adapter, **opts)
        puts opts
        @adapter = adapter
        @connection_string = opts
        @adapter_class = nil
        @conn = nil
        init_adapter
    end

    def query(query_str)
        conn.query(query_str)
    end

    def conn
        @conn ||= @adapter_class.new(**@connection_string)
    end

    private
        def init_adapter
            case @adapter
            when :mysql
                @adapter_class = MySQL
            when :Postgresql
                @adapter_class = Postgresql
            else
                raise StandardError.new("Unsupported adapted")
            end
        end
end

mysql = MySQL.new(username: "root", password: "root")
mysql.query("SELECT * FROM users")

puts mysql.conn

postgresql = Postgresql.new(username: "root", password: "root")
postgresql.query("SELECT * FROM users")

puts postgresql.conn

# Now using Adapter 
db = Database.new(:mysql, username: "root", password: "root")
db.query("SELECT * FROM users")

puts db.conn