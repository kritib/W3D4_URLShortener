class Click < ActiveRecord::Base
  # attr_accessible :url_id, :user_id
  belongs_to :user
  belongs_to :url
end
