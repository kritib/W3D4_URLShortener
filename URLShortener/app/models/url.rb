class Url < ActiveRecord::Base
  belongs_to :user
  has_many :clicks
  has_and_belongs_to_many :tags
end
