class CreateLunchMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :lunch_menus do |t|
      t.string :size
      t.string :name
      t.integer :price
      t.float :calorie
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.float :dietary_fiber
      t.integer :isSet
      t.integer :isValueSet
      t.integer :isValueConb
      t.string :category

      t.timestamps
    end
  end
end
