require 'sinatra'
require 'pg'

load "./local_env.rb" if File.exists?("./local_env.rb")

get "/" do 

	erb :start
end

post "/db" do

	db_params = {  # AWS db
        host: ENV['host'],
        port:ENV['port'],
        dbname:ENV['dbname'],
        user:ENV['dbuser'],
        password:ENV['dbpassword']
    }

    conn = PG::Connection.new(db_params)

	name = params[:name]
	student_id = params[:student_id]

	conn = PG::Connection.new(db_params)

    # determine current max index (id) in details table
    max_id = conn.exec("select max(id) from students")[0]

    # set index variable based on current max index value
    max_id["max"] == nil ? v_id = 1 : v_id = max_id["max"].to_i + 1

	# initialize variables for SQL insert statements (common table)
	v_name = name
	v_student_id = student_id

	# prepare SQL statement to insert common individual form fields into common table
	conn.prepare('q_statement',
	           "insert into students
	             (id, name, student_id)
	            values($1, $2, $3)")  # bind parameters

	# execute prepared SQL statement
	conn.exec_prepared('q_statement', [v_id, v_name, v_student_id])

	# deallocate prepared statement variable (avoid error "prepared statement already exists")
	conn.exec("deallocate q_statement")

	redirect to "/list"
end

get "/list" do

	erb :selection
end