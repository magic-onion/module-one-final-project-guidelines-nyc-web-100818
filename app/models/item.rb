class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items

  

end

#list all available items
#add item to a cart
