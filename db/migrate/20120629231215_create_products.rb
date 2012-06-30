class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :trackid
      t.string :artwork_url_60
      t.string :seller_name

      t.timestamps
    end
  end
end
