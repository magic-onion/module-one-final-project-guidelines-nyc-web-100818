require_relative '../config/environment'
require_relative './cli.rb'
require 'pry'

session = Cli.new("thing")
session.welcome_prompt
username = gets.chomp
session.user=(username)
session.run_list
