class User < ActiveRecord::Base
  has_many :urls
  has_many :comments
end
