class Item < ActiveRecord::Base
  has_many :cartitems
  has_many :carts, through: :cartitems


end
