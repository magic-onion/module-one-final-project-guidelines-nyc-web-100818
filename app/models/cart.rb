class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def item_count
    self.items.size
  end

  def cart_total
    self.items.map {|item| item.price}.reduce(:+)
  end

  def price_per_item
    total = self.cart_total
    total/self.item_count
  end

  def list_items
    self.items.map {|item| item.name}
  end

end
