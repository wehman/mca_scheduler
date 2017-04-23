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

	"#{classes} , #{name}, #{id}"
end