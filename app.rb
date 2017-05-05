require 'sinatra'
require 'pg'
require 'json'
require_relative 'sort.rb'

load "./local_env.rb" if File.exists?("./local_env.rb")


get "/" do 

  db_params = {
  host: ENV['host'],
  port:ENV['port'],
  dbname:ENV['dbname'],
  user:ENV['dbuser'],
  password:ENV['dbpassword']
  }

  conn = PG::Connection.new(db_params)

  classes = conn.exec("select * from classes where id='2'").values
  classes = classes[0]
  classes = classes[1..(classes.length - 1)]

	erb :st, :locals => {classes: classes}
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

  class_name_query = classes_final.keys.to_s.delete("[]").downcase.gsub(" ", "") #'Class1','Class2','Class3'...
  class_name_query_val = classes_final.keys.to_s.delete("[]").downcase.gsub(" ", "").gsub("\"", "\'") #'Class1','Class2','Class3'...
  class_limit_query = classes_final.values.to_s.delete("[]").gsub("\"", "\'") #'Limit1','Limit2','Limit3'...


  index = 1
  classes_final.each do |key, value|

    key = key.gsub(" ", "") if key.include?(" ")

    conn.exec "alter table classes add column #{key} varchar(60)"
    conn.exec "alter table students add column class#{index} varchar(60)"

    index += 1
  end

   conn.exec "insert into classes (#{class_name_query}) values (#{class_limit_query})"
   conn.exec "insert into classes (#{class_name_query}) values (#{class_name_query_val})"

  "#{class_name_query}"
end
 
post "/list" do

	classes = params[:classes]
  firstname = params[:first]
  middlei = params[:middle]
  lastname = params[:last]

  class_list = Hash.new

  index = 1
  classes.each do |key, value|

    class_list["#{index.to_s}"] = value
    index += 1
  end

  class_list["firstname"] = firstname
  class_list["middleinitial"] = middlei
  class_list["lastname"] = lastname

  class_col_query = ""
  (class_list.length - 3).times do |n|

    class_col_query += "class#{n + 1}, "
  end
  class_col_query.chop!
  class_col_query.chop!

  class_row_query = ""
  (class_list.length - 3).times do |n|

    class_row_query += "\'" + (class_list["#{n + 1}"] + "\'" + ", ")
  end
  class_row_query.chop!
  class_row_query.chop!
  class_row_query.chop!
  class_row_query[0] = ""

	db_params = {
	host: ENV['host'],
	port:ENV['port'],
	dbname:ENV['dbname'],
	user:ENV['dbuser'],
	password:ENV['dbpassword']
	}

	conn = PG::Connection.new(db_params)

  hash = JSON.generate(classes)

  conn.exec(
            "insert into students (firstname, middleinitial, lastname, #{class_col_query})
            values
            (
            '#{firstname}',
            '#{middlei}',
            '#{lastname}',
            '#{class_row_query}'
            )"
            )

  students = conn.exec("select * from students").values
  limits = conn.exec("select * from classes").values
  erb :studentconf
end 

post "/schedule" do

  db_params = {
  host: ENV['host'],
  port:ENV['port'],
  dbname:ENV['dbname'],
  user:ENV['dbuser'],
  password:ENV['dbpassword']
  }

  conn = PG::Connection.new(db_params)

  student_arr = conn.exec("select * from students").values
  limits_arr = conn.exec("select * from classes where id='2'").values
  classnames_arr = conn.exec("select * from classes where id='1'").values

  # "#{limits_arr}, #{classnames_arr}"

  roster = Sorting.new

  results = roster.fill(student_arr, limits_arr, classnames_arr)
  results = roster.left_overs(student_arr, limits_arr, classnames_arr)
  # results = roster.sort(student_arr, limits_arr, classnames_arr)

  "#{results}"

  erb :roster, :locals => {results: results}

  # ["1", "Max", "P", "Pokropowicz", nil, nil, nil, nil, nil] -----test for nil values

  # @arr_students = [["2", "Brain", "T", "Jewis", "class3", "class2", "class4", "class5", "class1"], ["3", "Cole", "F", "Pokropowicz", "class3", "class4", "class5", "class1", "class2"],["2", "Max", "Q", "Pokropowicz", "class1", "class2", "class4", "class5", "class3"],["2", "Coleen", "R", "Krenichen", "class2", "class3", "class4", "class5", "class1"],["2", "Brian", "T", "Lewis", "class4", "class5", "class3", "class2", "class1"],["2", "Gabe", "T", "Newell", "class3", "class5", "class4", "class2", "class1"]]

  # @arr_limits = ["1", "1", "1", "2", "1", "1"]

  # @arr_clnames = ["2", "math", "physx", "calc", "art", "music"]


  # mysorting = Sorting.new

  # @results = mysorting.fill(@arr_students, @arr_limits, @arr_clnames)

  # @results = mysorting.left_overs(@arr_students, @arr_limits, @arr_clnames)

  # @results = mysorting.sort(@arr_students, @arr_limits, @arr_clnames)


  # counter = 1
  # @results.each do |storage|
  #   print "#{@arr_clnames[counter]}: "
  #   storage.each do |student|
  #     print "#{student[1]} #{student[2]} #{student[3]}, "
  #   end
  #   counter += 1
  #   print "\n"
  # end
end