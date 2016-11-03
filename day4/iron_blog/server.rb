require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative "lib/blog.rb"
require_relative "lib/post.rb"

set :haml, format: :html5
enable(:sessions)

post1 = Post.new("title1", "conent1","carlos","sports")
post3 = Post.new("title3", "conent3","dani","politics")
post4 = Post.new("title4", "conent4","carlos","politics")
post5 = Post.new("title5", "conent5","dani","party")
post6 = Post.new("title6", "conent6","emilio","party")


@@blog = Blog.new([post1, post3, post4, post5, post6])

get '/blog' do
  # binding.pry
  @posts = @@blog.latest_posts
  erb(:index)
end

get '/post/:index' do
  i = params[:index].to_i
  @post = @@blog.latest_posts[i]
  erb(:post)
end

get '/new_post' do
  erb(:new_post)
end

post '/create_post' do
  new_post = Post.new(params[:title], params[:content],params[:author],params[:category])
  @@blog.add_post(new_post)
  redirect to('/blog')
end


