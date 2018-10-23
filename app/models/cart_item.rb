class Cart_item < ActiveRecord::Base
  belongs_to :carts
  belongs_to :items


end
