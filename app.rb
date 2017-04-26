require 'sinatra'
require 'pg'

load "./local_env.rb" if File.exists?("./local_env.rb")

get "/" do 

	erb :selection
end

post "/list" do

	classes = params[:classes]

	firstname = params[:first]
  middlei = params[:middle]
  lastname = params[:last]

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
            "insert into students (firstname, middleinitial, lastname, classes)
            values
            (
            '#{firstname}',
            '#{middlei}',
            '#{lastname}'
            '#{hash}'
            )"
            )

  namesb = conn.exec("select classes from students")

  "#{namesb[0]}"
end

