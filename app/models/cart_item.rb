class Cart_item < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item


end
