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

sevan = User.create!(email: "sevan.marian1@gmail.com", password: "matthieu")
matthieu = User.create!(email: "matthieu@gmail.com", password: "sevanee")
p "Users created"

place1 = Place.create!(user_id: sevan.id, capacity: 970, name: "starlight", address:"12 rue du faubourg saint antoine", city: "Paris", price: 1500, content: "la meilleur boite disco de paris")
place2 = Place.create!(user_id: matthieu.id, capacity: 380, name: "l'échangiste", address:"69 rue Pigalle", city: "Paris", price: 2000, content: "le meiller endroit pour vos soirées coqines")
p "Places created"

booking1 = Booking.create!(start_date: "15/11/2016", end_date: "30/11/2016", user_id: sevan.id, place_id: place1.id)
booking2 = Booking.create!(start_date: "15/11/2016", end_date: "30/11/2016", user_id: sevan.id, place_id: place2.id)
booking3 = Booking.create!(start_date: "15/11/2016", end_date: "30/11/2016", user_id: matthieu.id, place_id: place1.id)
booking4 = Booking.create!(start_date: "15/11/2016", end_date: "30/11/2016", user_id: matthieu.id, place_id: place2.id)
p "Bookigs created"

p "seed done"
