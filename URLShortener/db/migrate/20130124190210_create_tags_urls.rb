class CreateTagsUrls < ActiveRecord::Migration
  def change
    create_table :tags_urls do |t|
      t.integer :tag_id
      t.integer :url_id

      t.timestamps
    end
  end
end
