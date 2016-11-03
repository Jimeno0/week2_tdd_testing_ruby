class Blog
  attr_reader :posts
  def initialize(posts = [])
    @posts = posts
  end

  def add_post(post)
    @posts.push(post)
  end

  def latest_posts
    @posts.sort! {|a,b| b.date <=>a.date}
  end
end