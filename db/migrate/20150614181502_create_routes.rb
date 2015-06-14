class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :location_id
      t.integer :destination_id
      t.float :distance

      t.timestamps
    end
  end
end
