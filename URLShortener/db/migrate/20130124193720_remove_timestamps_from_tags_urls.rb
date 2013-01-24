class RemoveTimestampsFromTagsUrls < ActiveRecord::Migration
  def up
    remove_column :tags_urls, :created_at
    remove_column :tags_urls, :updated_at
  end

  def down
    add_column :tags_urls, :created_at, :datetime
    add_column :tags_urls, :updated_at, :datetime
  end
end
