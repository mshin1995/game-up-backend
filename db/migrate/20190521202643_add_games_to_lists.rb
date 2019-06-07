class AddGamesToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :games, :integer, array: true, default: []
  end
end
