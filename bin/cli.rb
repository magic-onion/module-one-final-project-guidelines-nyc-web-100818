require_relative '../config/environment'
require 'pry'
class Cli

  attr_reader :user, :cart

  def initialize(att1)
    @att1 = att1
    @user = user
    @cart = cart

  end

  def user=(username)
    @user = User.find_or_create_by(name: "#{username.downcase}")
  end

  #user must select a cart to do anything
  def select_cart
    puts "please enter a cart name to view or create one"
    cart_data = gets.chomp
    @cart = Cart.find_or_create_by(name: "#{cart_data.downcase}", user_id: @user.id)
  end

  def add_item
    puts "which item would you like to add?"
    input = gets.chomp
    @user.add_item_to_cart(@cart.name, "#{input}")
  end

  def list_items
    Item.list_names_with_prices
  end

  def display_cart
    @user.list_unique_items_and_counts(@cart.name)
  end

  def history
    @user.carts.each {|cart| puts "#{cart.name}"}
  end

  def cart_total
    total = @cart.cart_total
    puts "The total price of this cart is $#{total}0"
  end

  def list_items_and_prices
    cart = @cart.name
    @user.list_items_in_cart(cart)
  end

  def avg_price_per_item
    avg = @cart.avg_price_per_item
    puts "The average price per item of this cart is $#{avg.round(2)}"
  end

  def cart_options_helper
    puts "What would like to do today?", ""
    puts "- Type 'go back' to visit previous menu", ""
    puts "- Type 'items and prices' to display cart contents withs prices", ""
    puts "- Type 'price per item' to display this cart's average price per item", ""
  end

  # total spend on item

  def cart_options
    cart_options_helper
    input = ''
    while input
      puts "Please enter a cart command"
      input = gets.chomp
      case input
      when 'go back' then run_list
      when 'items and prices' then list_items_and_prices
      when 'price per item' then avg_price_per_item
      when 'exit' then exit
        break
      else puts "sorry, I'm not sure what that means"
         cart_options_helper
      end
    end
    cart_options
  end

def help
  puts "What would like to do today?", ""
  puts "-Type 'select cart' to start checking groceries", ""
  puts "- Type 'add' to add an item to your cart.", ""
  puts "- Type 'list' to list all items available for purchase", ""
  puts "- Type 'view' to view the contents of your cart", ""
  puts "- Type 'total' to display your current cart total", ""
  puts "- Type 'history' to display all of your carts", ""
  puts "- Type 'cart options' to enter cart menu and view cart options", ""
  puts "- Type 'exit' to exit this program", ""
end

  def run_list
    help
    input = ''
    while input
      puts "Please enter a command"
      input = gets.chomp
      case input
      when 'select cart' then select_cart
      when 'add' then add_item
      when 'list' then list_items
      when 'view' then display_cart
      when 'history' then history
      when 'total'then cart_total
      when 'cart options' then cart_options
      when 'exit' then exit
        break
      else puts "sorry, I'm not sure what that means"
         help
      end
    end
    run_list
  end

  def exit
   puts "Goodbye!"
   exit!
 end

end
