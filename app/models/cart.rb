class Cart < ActiveRecord::Base
  has_many :cartitems
  has_many :items, through: :cartitems



end
