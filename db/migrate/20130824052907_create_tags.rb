class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :category
      
      t.timestamps
    end
  end
end
