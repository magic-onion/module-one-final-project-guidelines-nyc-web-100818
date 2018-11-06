#cart methods
#  def cart_options_helper
#items and prices - DONE
#cart total - DONE
#avg price per item - DONE
#most expensive item
#least expensive item


module CartHelper

  def cart_total(array)
    if array.none?
      total = 0
      puts "The cart is empty", ""
    else
      all_prices = array.map {|item| item.price}
      total = all_prices.reduce(:+)
      total.round(2)
      puts "The total price of this cart is $#{total.round(2)}0", ""
    end
  end

  def list_items_and_prices(array)
    array.each {|item| puts "Spent $#{item.price}0 on #{item.name}", ""}
  end

  def avg_price_per_item(array)
    total = cart_total(array)
    divisor = array.size
    divisor = 0 ? 0.00 : avg = (total/divisor)
    puts "The average price per item of this cart is $#{avg.round(2)}", ""
  end

end

#intended modules:
# history helper for the history_options methods
# cart_helper for cart total and individual cart methods
# menu_helper to handle the console ouput
# Cli.rb should only hold the runtime methods
# take away all user powers, hold them in helper modules
