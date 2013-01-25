class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :tags_urls
  has_many :urls, :through => :tags_urls

  def self.get_tags
    all.map(&:name)
  end

  def open_url_with_tag(user)
    self.urls
  end

  def get_urls(num = 1)
    popular_urls = self.urls.sort_by {|u| u.clicks.count}.reverse
    popular_urls[0, num]
  end

  def whatever
    # counts = Hash.new(0)
    # self.urls.each {|url| counts[url] = url.total_clicks}
    # counts.sort_by! {|k, v| v}.reverse
  end
end
