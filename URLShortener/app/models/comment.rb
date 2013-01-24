class Comment < ActiveRecord::Base
  # attr_accessible :text, :url_id, :user_id
  belongs_to :url
  belongs_to :user
end
