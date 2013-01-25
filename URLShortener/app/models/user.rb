require 'launchy'         #Vincent - we got this to work by putting "gem 'launchy'" in the Gem project file instead of
                          # a require in the individual model files.
class User < ActiveRecord::Base
  has_many :urls
  has_many :comments
  has_many :clicks

  def self.to_user(string)
    if string.to_i == 0
      return User.find_by_name(string)
    else
      return User.find_by_id(string.to_i)     #Vincent - find_by_id may be able to be replaced by just find.
    end
  end

  def shorten(original_url)
    unless u = Url.to_url(original_url)   #Vincent - I don't quite understand this line. What does 'u' equal before
      u = Url.new                         # you get into the unless block?
      u.original_url = original_url
      u.user = self
      u.save
    end

    u.to_short
  end

  def open(short_url)
    if url = Url.to_url(short_url)
      register_click(url)
      url.print_comments
      Launchy.open(url.original_url)

    else
      puts "There is no such url in our database!"
    end
  end

  def get_urls
    self.urls.map(&:original_url)
  end

  def add_comment(url, comment_text)
    comment = Comment.new
    comment.url = url
    comment.user = self
    comment.text = comment_text
    comment.save
  end


  private
    def register_click(url)
      c = Click.new
      c.user = self
      c.url = url
      c.save
    end

end
