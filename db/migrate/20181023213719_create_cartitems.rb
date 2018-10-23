class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cartitems do |t|
      t.references :cart
      t.references :item
    end
  end
end
