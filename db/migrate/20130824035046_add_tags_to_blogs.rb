class AddTagsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :tags, :string
  end
end
