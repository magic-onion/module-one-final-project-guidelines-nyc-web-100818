require_relative '../config/environment'
require 'pry'
class Cli

  attr_reader :user, :cart

  def initialize(att1)
    @att1 = att1
    @user = user
    @cart = cart
    # @entry = entry

  end

  # def entry=(username)
  #   username = gets.chomp
  # end

  def user=(username)
    @user = User.find_or_create_by(name: "#{username.downcase}")
  end

  def select_cart
    puts "please enter a cart name to view or create one"
    cart_data = gets.chomp
    @cart = Cart.find_or_create_by(name: "#{cart_data.downcase}", user_id: @user.id)
  end

  def create_cart
    puts "please enter a cart name"
    input = gets.chomp
    @user.create_cart(input)
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

  def cart_total
    @cart.cart_total
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
      when 'view' then update_cart(cart)
      when 'history' then display_cart
      when 'total'then cart_total
      when 'exit' then exit
        break
      else help
      end
    end
    run_list
  end


end

#  user commands -
#  cart history: all carts and prices
# create new cart
# add items
# if invalid item, prompt for another item.
#   read-tasks: averaging, total price, average price of carts

#  user commands -
#  cart history: all carts and prices
# create new cart
# add items
# if invalid item, prompt for another item.
#   read-tasks: averaging, total price, average price of carts
# def welcome
#   puts "Welcome to our Grocery!"
# end


#very basic outline-ish
# def help
#   puts "What would like to do today?"
#   puts "- Type 'start' to begin a new shopping cart."
#   puts "- Type 'add'to add an item to your cart."
#   puts "- Type 'update' to "
#   puts "- Type 'history' to display your previous cart history"
#   puts "- Type 'exit' to exit this program"
# end
#
# def login
#   puts "Please enter your name:"
#   user_input = gets.chomp
#   logged_user = User.find_or_create_by(name: "#{user_input.downcase}")
#     puts "Welcome, #{logged_user.name}"
#     help
#     logged_user
# end
#
# def new_cart
#   puts "what would you like to call your cart?"
#   input = gets.chomp
#   user_name = gets.chomp
#   if User.find_by(name: user_name)
#     puts "Welcome back, #{user_name}"
#   else
#     User.create(name: user_name)
#     puts "Welcome, #{user_name}"
#   end
# end
#
# def cart_total
#   cart_total
# end
#
# def new_cart
#   create_cart(name)
#   Item.list_all_available
# end
#
# def add
#   add_item_to_cart(cart, item)
# >>>>>>> cli-file
# end
#
# def display_cart
#   login.carts
# end
#
#
#
# def exit
#   puts "Goodbye!"
#   exit
# end
#
#
#


#how do we call methods that are available to our models?
  #we need to store (based on user input) instances of our models to call them

#how do we store user inputs and match them to instances of our models

#Wrap
