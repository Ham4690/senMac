class AddDietaryFiberFromTestHambarger < ActiveRecord::Migration[5.2]
  def change
      add_column :test_hambargers, :dietary_fiber, :float
  end
end
