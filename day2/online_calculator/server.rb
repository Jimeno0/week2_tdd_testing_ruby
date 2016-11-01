require "sinatra"
require_relative "app/calculator.rb"
require "pry"

enable(:sessions)

get "/" do 
  session[:stored] ||= ""
  erb(:index)
end

get "/add" do
  @stored = session[:stored]
  @math = "add"
  @symbol = "+"
  erb(:form)
end

get "/substract" do
  @stored = session[:stored]
  @math = "substract"
  @symbol = "-"
  erb(:form)
end

get "/multiply" do
  @stored = session[:stored]
  @math = "multiply"
  @symbol = "*"
  erb(:form)
end

get "/divide" do
  @stored = session[:stored]
  @math = "divide"
  @symbol = "/"
  erb(:form)
end

post "/result" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  @symbol = params[:symbol]
  oper = params[:maths].to_sym
  @calculator = Calculator.new
  
  result = @calculator.send(oper,first,second)
  redirect to("/output/#{first}/#{second}/#{result}")
end

get "/output/:first/:second/:result" do
  @first = params[:first]
  @second = params[:second]
  @result = params[:result]
  erb(:output)
end

post "/store" do
  @result = params[:result]
  file = File.write("public/storage.txt",@result)
  session[:stored] = @result
  redirect to("/")
end



# f = File.open(route, "r")
#     f.each_line do |line|
#       @aux_board.push(line.chomp.split(" "))
#     end
#     f.close
