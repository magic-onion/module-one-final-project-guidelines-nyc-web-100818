class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def item_count
    self.items.size
  end

  def cart_total
    all_prices = self.items.map {|item| item.price}
    all_prices.reduce(:+)
  end

  def avg_price_per_item
    total = self.cart_total
    total/self.item_count
  end

  def list_items
    self.items.map {|item| item.name}
  end

end


#average cart cost
#total spent on item
