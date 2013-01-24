class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :tags_urls
  has_many :urls, :through => :tags_urls

  def open_url_with_tag(user)
    self.urls
  end
end
