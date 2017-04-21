
require 'pg'
load "./local_env.rb" if File.exists?("./local_env.rb")

begin

  # connect to the database
  # db_params = {  # AWS db
  #       host: ENV['host'],
  #       port:ENV['port'],
  #       dbname:ENV['dbname'],
  #       user:ENV['dbuser'],
  #       password:ENV['dbpassword']
  #     }
  db_params = {  # AWS db
        host: ENV['host'],
        port:ENV['port'],
        dbname:ENV['dbname'],
        user:ENV['dbuser'],
        password:ENV['dbpassword']
      }
  # db_params = {  # local db
  #       dbname:ENV['dbname'],
  #       user:ENV['dbuser'],
  #       password:ENV['dbpassword']
  #     }
  conn = PG::Connection.new(db_params)

  # drop common table if it exists
  conn.exec "drop table if exists students"

  # create the common table
  conn.exec "create table students (
             id int primary key,
             name varchar(60),
             student_id varchar(60))"

  # drop common table if it exists
  conn.exec "drop table if exists classes"

  # create the common table
  conn.exec "create table classes (
             id int primary key,
             name varchar(60),
             size int,
             description varchar(80))"

  # drop common table if it exists
  conn.exec "drop table if exists student_choices"

  # create the common table
  conn.exec "create table student_choices (
             id int primary key,
             student_id varchar(60),
             class_id varchar(60),
             rank int)"

  # drop common table if it exists
  conn.exec "drop table if exists class_rosters"

  # create the common table
  conn.exec "create table class_rosters (
             id int primary key,
             student_id varchar(60),
             class_id varchar(60))"

rescue PG::Error => e

  puts 'Exception occurred'
  puts e.message

ensure

  conn.close if conn

end