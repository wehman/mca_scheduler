require 'sinatra'
require 'pg'

load "./local_env.rb" if File.exists?("./local_env.rb")

get "/" do 

	erb :selection
end

post "/list" do

	classes = params[:classes]
	name = params[:name]
	id = params[:student_id]

	db_params = {  # AWS db
	host: ENV['host'],
	port:ENV['port'],
	dbname:ENV['dbname'],
	user:ENV['dbuser'],
	password:ENV['dbpassword']
	}

	conn = PG::Connection.new(db_params)

	# determine current max index (id) in details table
	max_id = conn.exec("select max(id) from students")[0]

	# prepare SQL statement to insert common individual form fields into common table
	conn.prepare('q_statement',
				"insert into students
				(name, student_id, classes)
				values($1, $2, $3)")  # bind parameters

	# execute prepared SQL statement
	conn.exec_prepared('q_statement', [name, id, classes])

	# deallocate prepared statement variable (avoid error "prepared statement already exists")
	conn.exec("deallocate q_statement")

	"#{classes} , #{name}, #{id}"
end