class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts

  #not used
  def create_cart(name)
    Cart.create(name: name, user_id: self.id, date_created: Date.today)
  end

  #not used
  def list_carts
    self.carts.each do |cart|
      puts "#{cart.name} was created on #{cart.date_created}"
    end
  end

  #cli.rb l.
  def total_spend #bugs out if there is nothing in a cart
    total = self.carts.map {|cart| cart.cart_total}
    result = total.reduce(:+)
    puts "Your spend since the beginning of time is $#{result}0", ""
  end

  #cli.rb l.
  def add_item_to_cart(cart, item)
    user_cart = Cart.find_by(name: "#{cart}")
    user_item = Item.find_by(name: "#{item}")
    if user_cart && user_item
      user_cart.items << user_item
    else
      puts "That doesn't seem to be possible, please try again.", ""
    end
  end

  #cli.rb l.
  def list_items_in_cart(cart)
    our_cart = Cart.find_by(name: cart)
    our_cart.items.each {|item| puts "Spent $#{item.price}0 on #{item.name}", ""}
    "what else can I do?"
  end


  #cli.rb l.
  def list_unique_items_and_counts(cart)
    our_cart = Cart.find_by(name: cart)
    count_display = {}
    count = 1
    our_cart.items.each do |item|
      if count_display[item.name] == count
        count +=1
        count_display[item.name] = count
      else
        count_display[item.name] = count
      end
    end
    count_display.each do |key, value|
      puts "you have #{value} of #{key}(s)", ""
    end
  end

  #cli.rb l.
  def total_spend_on_item(item)
    our_item = Item.find_by(name: item)
    spend = []
    self.carts.each do |cart|
      cart.items.each do |item|
        if our_item == item
          spend << item.price
        end
      end
    end
    total_spend = spend.reduce(:+)
    puts "You have spent $#{total_spend}0 on #{our_item.name}.", ""
  end

  #cli.rb l. 
  def average_cart_cost
    if self.carts.size == 0
      0
    else
      total = self.carts.map {|cart| cart.cart_total}.reduce(:+)
      divisor = Cart.all.size
      (total/divisor).round(2)
    end
  end

end
