class AddTagIdIndexToTag < ActiveRecord::Migration
  def change
    add_index :tags, :tag_id, :unique => true
  end
end
