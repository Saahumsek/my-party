# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Place.destroy_all
User.destroy_all

denis = User.create!(email: "denis@wagon.com", password: "denis1")
matthieu = User.create!(email: "matthieu@wagon.com", password: "matthieu")
p "2 users created"

