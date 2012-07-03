require 'globals'

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_id, :limit => 30
      t.string :name,   :limit => Globals::TAG_NAME_LENGTH

      t.timestamps
    end
  end
end
