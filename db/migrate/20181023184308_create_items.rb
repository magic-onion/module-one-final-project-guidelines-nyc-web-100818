class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string   :name
      t.integer  :price
      t.integer  :quantity
    end
  end
end

#Probably want to make a new migration to change the datatype of price to Float
