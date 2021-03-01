# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Frodo Baggins', email: 'frodo@shire.ca')
User.create(name: 'Gandalf White', email: 'gandalf@white.wiz')

user = User.find_by(name: 'Frodo Baggins')
Link.create(user_id: user.id, url: 'https://google.com', slug: 'google')
Link.create(user_id: user.id, url: 'https://google.com')

user = User.find_by(name: 'Gandalf White')
Link.create(user_id: user.id, url: 'https://google.com', slug: 'google123')
Link.create(user_id: user.id, url: 'https://google.com')
