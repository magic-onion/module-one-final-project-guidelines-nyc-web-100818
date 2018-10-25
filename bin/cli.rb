require_relative '../config/environment'

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
def help
  puts "What would like to do today?"
  puts "- Type 'start' to begin a new shopping cart."
  puts "- Type 'add'to add an item to your cart."
  puts "- Type 'update' to "
  puts "- Type 'history' to display your previous cart history"
  puts "- Type 'exit' to exit this program"
end

def login
  puts "Please enter your name:"
<<<<<<< HEAD
  user_input = gets.chomp
  logged_user = User.find_or_create_by(name: "#{user_input.downcase}")
    puts "Welcome, #{logged_user.name}"
    help
    logged_user
end

def new_cart
  puts "what would you like to call your cart?"
  input = gets.chomp
  login.create_cart("#{input}")
=======
  user_name = gets.chomp
  if User.find_by(name: user_name)
    puts "Welcome back, #{user_name}"
  else
    User.create(name: user_name)
    puts "Welcome, #{user_name}"
  end
end

def cart_total
  cart_total
end

def new_cart
  create_cart(name)
  Item.list_all_available
end

def add
  add_item_to_cart(cart, item)
>>>>>>> cli-file
end

def display_cart
  login.carts
end



def exit
  puts "Goodbye!"
  exit
end



def run_list
  login
  help
  input = ''
  while input
    puts "Please enter a command"

    when 'start' then new_cart(name)
    when 'add' then add
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


#how do we call methods that are available to our models?
  #we need to store (based on user input) instances of our models to call them

#how do we store user inputs and match them to instances of our models

#Wrap
