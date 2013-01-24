class Url < ActiveRecord::Base
  belongs_to :user
  has_many :clicks
  has_many :comments
  has_many :tags_urls
  has_many :tags, :through => :tags_urls
end
