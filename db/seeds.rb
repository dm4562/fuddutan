# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'item_types.csv'))
csv_data = CSV.parse csv_text, headers: true
csv_data.each do |row|
  item_type = ItemType.new
  item_type.name = row["name"]
  item_type.save
  puts "#{item_type.name} saved!"
end

buildings_text = File.read(Rails.root.join('lib', 'seeds', 'buildings.csv'))
buildings_data = CSV.parse buildings_text, headers: true
buildings_data.each do |row|
  building = Building.new
  building.name = row['buildings']
  building.save
  puts "#{building.name} inserted!"
end

# item = Item.new building_id:
user = GtUser.new
user.name = 'Dhruv Mehra'
user.email = 'dhruv@gmail.com'
user.password = 'dhruvmehra'
user.password_confirmation = 'dhruvmehra'
user.save
puts "#{user.name} inserted"
