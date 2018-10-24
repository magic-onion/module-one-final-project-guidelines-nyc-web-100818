class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :name
      t.references :user
      t.datetime :date_created
    end
  end
end
