# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create(
     user_name: 'username 1',
     email: 'jwrathall@gmail.com',
     first_name: 'jeff',
     last_name: 'wrathall',
     password: 'tobesalted',
)
