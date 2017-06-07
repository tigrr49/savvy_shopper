# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

a = User.new
a.email = "john.smith@sample.com"
a.password = "12341234"
a.password_confirmation = "12341234"
a.first_name = "John"
a.last_name = "Smith"
a.save

b = User.new
b.email = "mary.jones@sample.com"
b.password = "12341234"
b.password_confirmation = "12341234"
b.first_name = "Mary"
b.last_name = "Jones"
b.save

c = User.new
c.email = "tom.brown@sample.com"
c.password = "12341234"
c.password_confirmation = "12341234"
c.first_name = "Tom"
c.last_name = "Brown"
c.save

puts "#{User.count} users in the database"


Store.destroy_all

a = Store.new
a.name = "Jewel-Osco"
a.save

b = Store.new
b.name = "Food4Less"
b.save

c = Store.new
c.name = "Valli Produce"
c.save

puts "#{Store.count} stores in the database"


Category.destroy_all

a = Category.new
a.name = "Frozen"
a.save

b = Category.new
b.name = "Canned"
b.save

c = Category.new
c.name = "Produce"
c.save

d = Category.new
d.name = "Beverages"
d.save

puts "#{Category.count} categories in the database"


Item.destroy_all

a = Item.new
a.category_id = 1
a.name = "Pizza"
a.brand = "DiGiorno"
a.size = 31.5
a.unit_id = 1
a.save

b = Item.new
b.category_id = 2
b.name = "Chicken Noodle Soup"
b.brand = "Campbell's"
b.size = 10.75
b.unit_id = 1
b.save

c = Item.new
c.category_id = 3
c.name = "Avocado"
c.brand = "Hass"
c.size = 1
c.unit_id = 5
c.save

d = Item.new
d.category_id = 1
d.name = "Chicken Wings"
d.brand = "Tyson"
d.size = 5
d.unit_id = 2
d.save

e = Item.new
e.category_id = 4
e.name = "Root Beer"
e.brand = "Barq's"
e.size = 2
e.unit_id = 4
e.save

puts "#{Item.count} items in the database"


Unit.destroy_all

a = Unit.new
a.name = "oz"
a.save

b = Unit.new
b.name = "lb"
b.save

c = Unit.new
c.name = "mL"
c.save

d = Unit.new
d.name = "L"
d.save

e = Unit.new
e.name = "count"
e.save

puts "#{Unit.count} unit types in the database"


PriceEntry.destroy_all

a = PriceEntry.new
a.item_id = 1
a.store_id = 1
a.price = 3
a.save

b = PriceEntry.new
b.item_id = 1
b.store_id = 1
b.price = 3.50
b.save

c = PriceEntry.new
c.item_id = 1
c.store_id = 2
c.price = 3.33
c.save

d = PriceEntry.new
d.item_id = 2
d.store_id = 2
d.price = 1
d.save

e = PriceEntry.new
e.item_id = 2
e.store_id = 3
e.price = 0.75
e.save

f = PriceEntry.new
f.item_id = 3
f.store_id = 1
f.price = 0.8
f.save

g = PriceEntry.new
g.item_id = 4
g.store_id = 3
g.price = 13.70
g.save

puts "#{PriceEntry.count} price entries in the database"


ShoppingListItem.destroy_all

a = ShoppingListItem.new
a.user_id = 1
a.item_id = 1
a.quantity = 2
a.save

b = ShoppingListItem.new
b.user_id = 1
b.item_id = 2
b.quantity = 1
b.save

c = ShoppingListItem.new
c.user_id = 2
c.item_id = 1
c.quantity = 1
c.save

puts "#{ShoppingListItem.count} shopping list entries in the database"
