class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :origin
      t.string :destination
      t.float :distance
      t.integer :map_id

      t.timestamps
    end
  end
end
