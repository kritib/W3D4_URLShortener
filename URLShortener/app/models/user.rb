require 'launchy'

class User < ActiveRecord::Base
  has_many :urls
  has_many :comments

  def shorten(original_url)
    unless u = Url.to_url(original_url)
      u = Url.new
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

  private
    def register_click(url)
      c = Click.new
      c.user = self
      c.url = url
      c.save
    end

end
