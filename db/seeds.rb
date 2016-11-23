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
place1 = Place.create!(user_id: sevan.id, capacity: 970, name: "starlight", address:"12 rue du faubourg saint antoine", zip_code: 75012, city:"paris", country: "FR", price: 1500, content: "la meilleur boite disco de paris")
place2 = Place.create!(user_id: matthieu.id, capacity: 380, name: "l'échangiste", address:"69 rue Pigalle", zip_code: 75009, city:"paris", country: "FR", price: 2000, content: "le meiller endroit pour vos soirées coqines")
p "2 places created"

p "seed done"
