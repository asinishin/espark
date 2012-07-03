class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :example, :limit => 30

      t.timestamps
    end
  end
end
