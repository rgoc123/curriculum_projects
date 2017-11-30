# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Band.destroy_all
Album.destroy_all

a = User.create!(email: 'test@gmail.com', password: 'password')
b = User.create!(email: 'test123@gmail.com', password: 'password')


c = Band.create!(name: 'band1')
d = Band.create!(name: 'band2')
e = Band.create!(name: 'band3')

f = Album.create!(title: 'wow', band_id: c.id, yr: 2000)
g = Album.create!(title: 'wows', band_id: c.id, yr: 2002)
h = Album.create!(title: 'wowsers', band_id: d.id, yr: 2010)
