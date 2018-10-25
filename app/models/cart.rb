class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def item_count
    self.items.size
  end

  #cli.rb l.
  def cart_total
    if self.items == []
      total = 0
    else
      all_prices = self.items.map {|item| item.price}
      total = all_prices.reduce(:+)
      total
    end
  end

    #cli.rb l.
  def avg_price_per_item
    total = self.cart_total
    divisor = self.item_count
    if divisor == 0
      0.00
    else
      avg = total/divisor
      avg.round(3)
    end
  end

  #not used
  def list_items
    self.items.map {|item| item.name}
  end

  def remove_item(name)
    self.items.each do |item|
      if item.name == name
        self.items.delete(item)
      end
    end
  end

end
