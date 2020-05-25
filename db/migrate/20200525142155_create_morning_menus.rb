class CreateMorningMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :morning_menus do |t|
      t.string :size
      t.string :name
      t.integer :price
      t.float :calorie
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.float :dietary_fiber
      t.integer :isSet
      t.integer :isSetNoSide
      t.integer :isConb
      t.string :category

      t.timestamps
    end
  end
end
