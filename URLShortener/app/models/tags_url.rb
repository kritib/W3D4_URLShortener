class TagsUrl < ActiveRecord::Base      #Vincent - maybe change the file name to be "tagsurl.rb" to be consistent with
  # attr_accessible :tag_id, :url_id    # model name.
  belongs_to :tag
  belongs_to :url
end
