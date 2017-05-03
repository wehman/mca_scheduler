require 'sinatra'
require 'pg'
require 'json'

load "./local_env.rb" if File.exists?("./local_env.rb")


get "/" do 

	erb :st
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

post "/teacher" do 

  class_names = params[:classes].values
  limits = params[:limit].values

  classes_final = Hash.new

  #new hash in form of {ClassName => ClassLimit,}
  class_names.each_with_index do |name, index|

    classes_final["#{name}"] = limits[index]
  end

  db_params = {
  host: ENV['host'],
  port:ENV['port'],
  dbname:ENV['dbname'],
  user:ENV['dbuser'],
  password:ENV['dbpassword']
  }

  conn = PG::Connection.new(db_params)

  conn.exec "drop table if exists classes"

  conn.exec "create table classes (id serial primary key)"

  class_name_query = classes_final.keys.to_s.delete("[]").downcase #'Class1','Class2','Class3'...
  class_limit_query = classes_final.values.to_s.delete("[]").gsub("\"", "\'") #'Limit1','Limit2','Limit3'...

  classes_final.each do |key, value|

    conn.exec "alter table classes add column #{key} varchar(60)"
   
  end

   conn.exec "insert into classes (#{class_name_query}) values (#{class_limit_query})"

  "#{class_name_query}"
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