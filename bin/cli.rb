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
end

def display_cart
  list_cart
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
    input = gets.chomp
    case input
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
