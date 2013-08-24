class RemoveTagsFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :tags
  end
end
