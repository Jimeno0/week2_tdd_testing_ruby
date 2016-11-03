# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__
# require_relative "../server.rb"

describe 'The Irontwit' do
  before(:all) do
    post1 = Post.new("title1", "conent1","carlos","sports")
    post3 = Post.new("title3", "conent3","dani","politics")
    sleep(10)
    post4 = Post.new("title4", "conent4","carlos","politics")
    @@blog = Blog.new([post1, post4, post3])
  end

  describe "get '/blog'" do
    it "renders the home page" do 
      get "/blog"
      expect(last_response).to be_ok
    end    
  end

  describe "get '/post/:index'" do
    before (:each)do 
      get "/post/0"
    end
    it 'renders the post page' do
      expect(last_response). to be_ok
    end
    it 'page contents post from index posotion' do
      expect(last_response.body).to include("conent4")
    end
  end

  describe "get '/new_post'" do
    it 'renders a form with inputs' do
      get '/new_post'
      expect(last_response.body). to include("<input")
    end
  end

  describe "post '/create_post'" do
    it 'increase number of posts' do
      size = @@blog.posts.length
      post('/create_post', title:"title", content: "content", author: "author posts", category: "post category")
      expect(@@blog.posts.length).to be > size 
    end
  end
end


