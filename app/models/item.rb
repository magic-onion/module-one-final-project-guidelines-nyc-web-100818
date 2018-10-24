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

end
