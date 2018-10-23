class CreateCartitems < ActiveRecord::Migration[5.0]
  def change
    create_table :cartitems do |t|
      t.integer :cart_id
      t.integer :item_id
    end
  end
end
