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

	db_params = {
	host: ENV['host'],
	port:ENV['port'],
	dbname:ENV['dbname'],
	user:ENV['dbuser'],
	password:ENV['dbpassword']
	}

	conn = PG::Connection.new(db_params)

	conn.exec(
            "insert into students (name, student_id)
            values
            (
            '#{name}',
            '#{id}'
            )"
            )

	classes.each do |key, value|

    conn.prepare('q_statement',"insert into students (classes)
                              values ($1)
                              where student_id='#{id}'")

		conn.exec_prepared('q_statement', ["#{key}=>#{value}"])
	end

  conn.exec("deallocate q_statement")

  "#{classes}"
end