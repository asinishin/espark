class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :track_name
      t.string :artwork_url_60

      t.timestamps
    end
  end
end
