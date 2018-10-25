require_relative '../config/environment'
require_relative './cli.rb'
require 'pry'

a = Cli.new("thing")
a.welcome_prompt
username = gets.chomp
a.user=(username)
a.run_list
