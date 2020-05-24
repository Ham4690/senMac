class CreateTestHambargers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_hambargers do |t|
      t.string :name
      t.integer :price
      t.float :calorie
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.float :dietary_fider

      t.timestamps
    end
  end
end
