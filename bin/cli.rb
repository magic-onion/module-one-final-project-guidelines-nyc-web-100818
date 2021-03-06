require_relative '../config/environment'
require_relative './modules/cart_helper.rb'
require_relative './modules/history_helper.rb'
require 'pry'
class Cli
  include CartHelper
  include HistoryHelper

  attr_reader :user, :cart

  def initialize(att1)
    @att1 = att1
    @user = user
    @cart = cart
  end

  #helper methods
  def select_cart_prompt
    if @cart == nil
      puts "you need a cart first!", ""
      select_cart
    end
  end

  def empty_cart
    if @cart.items == []
      puts "The cart is empty", ""
    end
  end

  #custom setter returns an instance of user as a c
  def user=(username)
    @user = User.find_or_create_by(name: "#{username.downcase}")
  end

  #methods for main menu

  def welcome_prompt
    puts "Thank you for using Grocery Tracker. Please enter your username which is currently Alex - Nov", ""
  end

  def select_cart
    puts "please enter a cart name to view or create one", ""
    cart_data = gets.chomp
    @cart = Cart.find_or_create_by(name: "#{cart_data.downcase}", user_id: @user.id)
  end

  def add_item
    select_cart_prompt
    puts "which item would you like to add?", ""
    input = gets.chomp
    added_item = Item.find_by(name: "#{input}")
      if !added_item
        puts "That item can't be added to the cart"
      else

        @cart.items << added_item
        puts "You have added #{added_item.name} to the cart"
      end

  end

#actually removes all instances of that item
  def remove_an_item
    select_cart_prompt
    if @cart.items == []
      empty_cart
    else
      puts "Which item would you like to remove?," ""
      input = gets.chomp
      @cart.remove_item(input)
    end
  end

  def list_items

    Item.list_names_with_prices

  end

  def display_cart
    select_cart_prompt
    if @cart.items == []
      puts "the cart is empty", ""
    else
      @user.list_unique_items_and_counts(@cart.id)
    end
  end

  def history
    puts "You Cart(s)", ""
    @user.carts.each {|cart| puts "#{cart.name}", ""}
  end

  def exit
    puts "Goodbye!"
    exit!
  end

  #the total price of a cart
  def cart_totaller
    select_cart_prompt
    cart_total(@cart.items)
  end

  #cart options methods
  def items_and_prices
    list_items_and_prices(@cart.items)
  end

  #was broken. TESTS NEEDED
  def avg_price_of_item
    empty_cart
    select_cart_prompt
    avg_price_per_item(@cart.items)
  end

  #history options methods
  def item_spend
    puts "please enter an item", ""
    input = gets.chomp
    @user.total_spend_on_item("#{input}")
  end

  def total_spent
    totals = @user.carts.map {|cart| cart_total(cart.items)}
    totals.reduce(:+)
    puts "Total spent is $#{totals}0"
  end

  def average_cart_cost
    result = @user.average_cart_cost
    puts "Your carts cost an average of $#{result}", ""
  end

  #main menu
  def help
    puts "What would like to do today?", ""
    puts "-Type 'select cart' to start checking groceries", ""
    puts "- Type 'add' to add an item to your cart.", ""
    puts "- Type 'remove' to remove an item to your cart.", ""
    puts "- Type 'list' to list all items available for purchase", ""
    puts "- Type 'view' to view the contents of your cart", ""
    puts "- Type 'total' to display your current cart total", ""
    puts "- Type 'history' to display all of your carts", ""
    puts "- Type 'history options' to enter history menu", ""
    puts "- Type 'cart options' to enter cart menu and view cart options", ""
    puts "- Type 'exit' to exit this program", ""
  end

  def run_list
    help
    input = ''
    while input
      puts "Please enter a command", ""
      input = gets.chomp
      case input
      when 'select cart' then select_cart
      when 'add' then add_item
      when 'remove' then remove_an_item
      when 'list' then list_items
      when 'view' then display_cart
      when 'history' then history
      when 'total'then cart_totaller
      when 'cart options' then cart_options
      when 'history options' then history_options
      when 'exit' then exit
        break
      else puts "sorry, I'm not sure what that means"
        help
      end
    end
    run_list
  end

  #cart options menu
  def cart_options_helper
    puts "What would like to do today?", ""
    puts "- Type 'go back' to visit previous menu", ""
    puts "- Type 'items and prices' to display cart contents with prices", ""
    puts "- Type 'price per item' to display this cart's average price per item", ""
    puts "- Type 'total' to display this cart's total cost", ""
    puts "- Type 'help' to display cart options", ""
    puts "- Type 'exit' to exit", ""
  end

  def cart_options
    #most expensive item
    #remove item?
    select_cart_prompt
    cart_options_helper
    input = ''
    while input

      puts "Please enter a cart command", ""
      input = gets.chomp
      case input
      when 'go back' then run_list
      when 'items and prices' then items_and_prices
      when 'price per item' then avg_price_of_item
      when 'total' then cart_totaller
      when 'view' then display_cart
      when 'help' then cart_options_helper
      when 'exit' then exit
        break
      else puts "sorry, I'm not sure what that means", ""
        cart_options_helper
      end
    end
    cart_options
  end

  #history options menu
  def history_options_helper
    puts "What would like to do today?", ""
    puts "- Type 'go back' to visit previous menu", ""
    puts "- Type 'total spend on item' to display the total amount spent on a single item", ""
    puts "- Type 'average cost' to display the average cost of a cart", ""
    puts "- Type 'total spent' to display the total cost of all your carts", ""
    puts "- Type 'help' to display history options", ""
    puts "- Type 'exit' to exit this program", ""
  end

  def history_options
    history_options_helper
    input = ''
    while input
      puts ('~' * 80)
      puts "Please enter a history command", ""
      input = gets.chomp
      case input
      when 'go back' then run_list
      when 'total spend on item' then item_spend
      when 'total spent' then total_spent
      when 'average cost' then average_cart_cost
      when 'help' then history_options_helper
      when 'exit' then exit
        break
      else puts "sorry, I'm not sure what that means", ""
        history_options_helper
      end
    end
    puts ('~' * 80)
    history_options
  end

end
