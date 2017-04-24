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

  hash = ""

  classes.each do |key, value|

    hash += "#{key}=>#{value},"
  end

  hash.chop!

  conn.exec(
            "insert into students (name, student_id, classes)
            values
            (
            '#{name}',
            '#{id}',
            '#{hash}'
            )"
            )

  "#{classes}"
end