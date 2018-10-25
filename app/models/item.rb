class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items

  #redundant now that self.list_names_with_prices is defined
  def self.list_all_available
    Item.all.each do |item|
      puts "#{item.name}"
    end
    puts "anything else?"
  end

  #for early testing purposes
  def self.list_ids_with_names
    self.all.each {|item| puts "#{item.id} - #{item.name}"}
  end

  #cli.rb l. 52
  def self.list_names_with_prices
    self.all.each {|item| puts "#{item.name} - $#{item.price}0"}
  end

end
