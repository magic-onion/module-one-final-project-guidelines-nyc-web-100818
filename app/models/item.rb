class Item < ActiveRecord::Base
  belongs_to :cart

  attr_accessor :name, :quantity, :price

end
