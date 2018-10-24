class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts

  

end


#User abilities:

# create a cart
# add items to a cart
# see all their carts < - u1.carts
# see all the items in their carts
# find out their total spend <- using a cart helper method.

