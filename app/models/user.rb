class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts

  def create_cart(name)
    Cart.create(name: name, user_id: self.id, date_created: Date.today)
  end

  def list_carts
    self.carts.each do |cart|
      puts "#{cart.name} was created on #{cart.date_created}"
    end
    puts "anything else?"
  end

  def total_spend #bugs out if there is nothing in a cart
    total = self.carts.map {|cart| cart.cart_total}.reduce(:+)
    puts "Your spend since the beginning of time is #{total}"
  end

  def add_item_to_cart(item)
    case
    when !Item.find_by(name: name)

  end
end


#User abilities:

# create a cart
# see all their carts < - u1.carts
# see all the items in their carts
# find out their total spend <- using a cart helper method.

#
# u1.create_cart
# => a new cart associated with that user
