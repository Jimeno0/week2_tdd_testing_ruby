require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative "app/todo.rb"
require_relative "app/task.rb"

set :haml, format: :html5
enable(:sessions)

@@todo_list = TodoList.new("Charlie")
cat_task = Task.new("walk the dog")
dinner_task = Task.new("Make the dinner")
@@todo_list.add_task(cat_task)
@@todo_list.add_task(dinner_task)

get '/' do
  erb(:index)
end

get '/new_task' do
  erb(:new_task)
end

post '/create_task' do
  task = Task.new(params[:task])
  @@todo_list.add_task(task)
  redirect to("/")
end 

get "/complete/:id" do
  @@todo_list.find_task_by_id(params[:id].to_i).complete!
  erb(:index)
end

get "/delete/:id" do
  @@todo_list.delete_task(params[:id].to_i)
  erb(:index)
end