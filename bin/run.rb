require_relative '../config/environment'
require_relative './cli.rb'
require 'pry'


puts "Welcome to a Grocery Checker"

a = Cli.new("thing")
a.welcome_prompt
username = gets.chomp
a.user=(username)
a.run_list
