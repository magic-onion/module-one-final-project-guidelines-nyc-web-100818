class Item < ActiveRecord::Base
  has_many :carts, through: :cartitems


end
