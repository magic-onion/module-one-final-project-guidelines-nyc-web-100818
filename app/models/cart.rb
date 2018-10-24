class Cart < ActiveRecord::Base
  has_many :cartitems
  has_many :items, through: :cart_items



end
