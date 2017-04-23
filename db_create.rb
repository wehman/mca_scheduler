
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

  conn.exec "create extension hstore"

  # drop common table if it exists
  conn.exec "drop table if exists students"

  # create the common table
  conn.exec "create table students 
             (
             id serial primary key,
             name varchar(60),
             student_id varchar(60),
             classes hstore
             )"

rescue PG::Error => e

  puts 'Exception occurred'
  puts e.message

ensure

  conn.close if conn

end