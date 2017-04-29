require 'sinatra'
require 'pg'
require 'json'

load "./local_env.rb" if File.exists?("./local_env.rb")

configure do

  Cache::init()
end

get "/" do 

  classes_made = Cache::classes_made()

	erb :st, :locals => {classes_made: classes_made}
end

post "/decide" do

  choice = params[:choice]

  if choice == "student"
    redirect to "/student"
  else
    redirect to "/teacher"
  end
end

get "/student" do

  erb :selection
end

get "/teacher" do 

  "oi"
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

  hash = JSON.generate(classes)

  # conn.exec(
  #           "insert into students (firstname, middleinitial, lastname, classes)
  #           values
  #           (
  #           '#{firstname}',
  #           '#{middlei}',
  #           '#{lastname}',
  #           '#{hash}'
  #           )"
  #           )

  namesb = conn.exec("select classes from students")

  classq = namesb[0]["classes"]

  class3 = JSON.parse(classq)

  class4 = Hash.new

  index = 1

  class3.each do |key, value|

    index = index.to_s

    class4[index] = value

    index = index.to_i

    index += 1
  end


  erb :studentconf
end 

class Cache

  @@classes_made = false
end
