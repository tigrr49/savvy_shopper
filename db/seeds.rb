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

puts "#{Category.count} categories in the database"


Item.destroy_all

a = Item.new
a.category_id = 1
a.name = "Pizza"
a.brand = "DiGiorno"
a.size = 31
a.save

b = Item.new
b.name = "Canned"
b.save

c = Item.new
c.name = "Produce"
c.save

puts "#{Item.count} items in the database"


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

puts "#{Category.count} categories in the database"


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

puts "#{Category.count} categories in the database"
