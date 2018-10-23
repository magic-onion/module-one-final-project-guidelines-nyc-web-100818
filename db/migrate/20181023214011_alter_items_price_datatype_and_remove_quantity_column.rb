class AlterItemsPriceDatatypeAndRemoveQuantityColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :price, :float
    remove_column :items, :quantity
  end
end
