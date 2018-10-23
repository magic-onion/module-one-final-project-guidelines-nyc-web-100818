User.destroy_all
Item.destroy_all
Cart.destroy_all

u1 = User.create(name: "alex")
u2 = User.create(name: "jon")

carrot = Item.create(name: "carrot", price: 1, quantity: 2)
milk = Item.create(name: "milk", price: 2, quantity: 1)

c1 = Cart.create(name: "alex's cart", date_created: Date.today)
c2 = Cart.create(name: "jon's cart", date_created: Date.today)

#to do - add cartitems model and migration
#to do - modify price column and remove quantity
