require "pry"
require_relative "../lib/blog.rb"
require_relative "../lib/post.rb"


RSpec.describe Blog do
  before (:each)do
    @post1 = Post.new("title1", "conent1")
    @post2 = Post.new("title2", "conent2")
    @post3 = Post.new("title3", "conent3")
    @blog = Blog.new([@post1, @post2, @post3])
    # binding.pry
  end
  describe '.posts' do
    it "contains the posts added" do 
      expect(@blog.posts).to include(@post1)
    end    
  end

  describe '.latest_posts' do
    it 'shows latest posts firsts' do
      expect(@blog.latest_posts[0]).to eq(@post3)      
    end
  end 
end