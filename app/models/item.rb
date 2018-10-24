class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items

  def self.list_all_available
    Item.all.each do |item|
      puts "#{item.name}"
      sleep(0.1)
    end
    puts "anything else?"
  end

  def self.list_ids_with_names
    self.all.each {|item| puts "#{item.id} - #{item.name}"}
    "done"
  end

end
