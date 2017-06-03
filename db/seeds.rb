# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.new
u1.email = "paul.nguye@kellogg.northwestern.edu"
u1.password = "pd2017"
u1.password_confirmation = "12341234"
u1.first_name = "Paul"
u1.last_name = "Nguyen"
u1.save

puts "#{User.count} users in the database"
