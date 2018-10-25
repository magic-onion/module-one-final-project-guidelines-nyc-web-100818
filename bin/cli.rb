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
end

def display_cart
  login.carts
end


# def display_cart

# end

def exit
  puts "Goodbye!"
  exit
end



def run_list
  help
  input = ''
  while input
    puts "Please enter a command"
    input = gets.chomp
    case input
    when 'start' then new_cart
    when 'add' then add_item_to_cart(cart, item)
    when 'view' then update_cart(cart)
    when 'history' then display_cart
    when 'total'
    when 'exit' then exit
      break
    else help
    end
  end
  run_list
end
