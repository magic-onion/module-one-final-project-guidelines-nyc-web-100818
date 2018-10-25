require_relative '../config/environment'
require_relative './cli.rb'
require 'pry'


puts "Welcome to a Grocery Checker"

a = Cli.new("thing")
puts "enter your name jerk"
username = gets.chomp
a.user=(username)
a.select_cart
binding.pry
puts "h"
# run_list

#welcome prompt
#"login"
  #find or create by
#welcome prompt for use
#menu
