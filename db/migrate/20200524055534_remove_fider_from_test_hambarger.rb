class RemoveFiderFromTestHambarger < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_hambargers, :dietary_fider, :float
  end
end
