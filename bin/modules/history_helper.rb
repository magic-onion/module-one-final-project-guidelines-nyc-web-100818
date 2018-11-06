#history methods found

module HistoryHelper
  include CartHelper

  def total_spend #bugs out if there is nothing in a cart
    total = self.carts.map {|cart| cart.cart_total}
    total
    result = total.reduce(:+)

    puts "Your spend since the beginning of time is $#{result}0", ""
  end

end



# def history_options_helper
#   puts "What would like to do today?", ""
#   puts "- Type 'go back' to visit previous menu", ""
#   puts "- Type 'total spend on item' to display the total amount spent on a single item", ""
#   puts "- Type 'average cost' to display the average cost of a cart", ""
#   # puts "- Type 'total spent' to display the total cost of all your carts", ""
#   puts "- Type 'help' to display history options", ""
#   puts "- Type 'exit' to exit this program", ""
# end
