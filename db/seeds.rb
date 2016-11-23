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
p "2 users created"
place1 = Place.create!(user_id: sevan.id, city: "Paris", capacity: 970, name: "starlight", address:"12 rue du faubourg saint antoine", city:"paris", price: 1500, content: "la meilleur boite disco de paris")
place2 = Place.create!(user_id: matthieu.id, city: "Ibiza", capacity: 380, name: "l'échangiste", address:"69 rue Pigalle", city:"paris", price: 2000, content: "le meiller endroit pour vos soirées coqines")
p "2 places created"

p "seed done"
