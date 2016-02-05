# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |t|
  Category.create!(name: "Ruby 0.#{t}")
end

User.create!(name: 'Abhinav Mathur', email: 'raaaaj5000@yahoo.co.in', password: 'password', admin: true)