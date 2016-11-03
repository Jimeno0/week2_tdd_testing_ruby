class Post
  attr_reader :date, :content, :title, :author, :category
  def initialize(title,content,author,category=nil)
    @title = title
    @content = content
    @date = Time.new
    @author = author
    @category = category
  end
end

class SponsoredPost < Post  
end