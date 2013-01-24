class Url < ActiveRecord::Base
  belongs_to :user
  has_many :clicks
  has_many :comments
  has_many :tags_urls
  has_many :tags, :through => :tags_urls

  PREFIX = "Mario&Kriti"

  def print_comments
    if self.comments.empty?
      puts "This link has no comments."
    else
      self.comments.each do |comment|
        puts "Comment by #{comment.user.name} at #{comment.created_at}:"
        puts comment.text
        puts
      end
    end
  end

  def total_clicks
    self.clicks.size
  end

  def to_short
    "#{PREFIX}/#{self.id}"
  end

  def self.to_url(string)
    split_string = string.split("/")
    if split_string[0] == PREFIX
      return Url.find_by_id(split_string[1].to_i)
    else
      return Url.find_by_original_url(string)
    end
  end

  def add_tags(tags_array)
    tags_array.each do |tag|
      t = Tag.find_or_create_by_name(tag)
      self.tags << t
    end
  end
end
