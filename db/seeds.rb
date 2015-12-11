# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

admin = User.create(
    # name: 'admin',
    email: 'admin@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld'
  )
admin.save!


admin2 = User.create(
    # name: 'admin2',
    email: 'admin2@example.com',
    password: 'foobarbaz',
    password_confirmation: 'foobarbaz'
  )



admin2.save!
# 5.times do |place|
#   place =  Place.new(
#     :name => Faker::Name.name,
#     :address => Faker::Address.street,
#     :city => Faker::Address.city,
#     :phone => '122223342',
#     :category => 'testcategory',
#     :googleid => "AIzaSyCmtjCERax6MXKjxLv41v76Ai0ooP3cFv0",
#     :photos => "https://i.imgur.com/SiwUkyY.gif"
#   )
# end

# place.save!

puts "#{User.count} were created."
puts "#{Place.count} were created."
# puts "#{Usertips.count} were created."
# puts "#{Usertags.count} were created."
