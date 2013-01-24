class TagsUrl < ActiveRecord::Base
  # attr_accessible :tag_id, :url_id
  belongs_to :tag
  belongs_to :url
end
