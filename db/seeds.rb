User.delete_all
Item.delete_all
Cart.delete_all

u1 = User.create(name: "alex")
u2 = User.create(name: "jon")


carrot = Item.create(name: "carrot", price: 1.0)
milk = Item.create(name: "milk", price: 2.0)

c1 = Cart.create(name: "alex's cart", date_created: Date.today)
c2 = Cart.create(name: "jon's cart", date_created: Date.today)

ct1 = CartItem.create(cart_id: 1, item_id: 1)
ct2 = CartItem.create(cart_id: 1, item_id: 1)

puts "#{c1.id}"
