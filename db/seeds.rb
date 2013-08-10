# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create([
  {email:'0nesup@naver.com', password:'1234'}
  ])
User.first.update( role: Role.with_name(:admin) )
puts "created #{User.first.email} and that made administer"