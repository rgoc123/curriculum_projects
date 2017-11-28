# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRentalRequest.destroy_all

c1 = Cat.create(name: 'Fluffy', birth_date: '2015/01/20', color: 'black', sex: 'M', description: 'Fluffy black cat')
c2 = Cat.create(name: 'Sunny', birth_date: '2016/01/20', color: 'tuxedo', sex: 'M', description: 'Cool cat')
c3 = Cat.create(name: 'Orange', birth_date: '2017/09/01', color: 'orange', sex: 'F', description: 'Fluffy orange cat')
c4 = Cat.create(name: 'Lavendar', birth_date: '2001/02/23', color: 'purple', sex: 'F', description: 'Fluffy black cat')

CatRentalRequest.create(cat_id: c1.id, start_date: '2017/01/01', end_date: '2018/01/01')
CatRentalRequest.create(cat_id: c2.id, start_date: '2016/01/01', end_date: '2018/01/01')
CatRentalRequest.create(cat_id: c3.id, start_date: '2017/01/01', end_date: '2018/01/01')
CatRentalRequest.create(cat_id: c4.id, start_date: '2017/01/01', end_date: '2018/01/01', status: 'APPROVED')
CatRentalRequest.create(cat_id: c4.id, start_date: '2014/01/01', end_date: '2015/01/01', status: 'APPROVED')
CatRentalRequest.create(cat_id: c4.id, start_date: '2015/01/02', end_date: '2015/12/31', status: 'APPROVED')





