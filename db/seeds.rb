# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib','seeds','item_types.csv'))
csv_data = CSV.parse csv_text, headers: true
csv_data.each do |row|
  # puts row.to_hash
  item_type = ItemType.new
  item_type.name = row["name"]
  item_type.save
  puts "#{item_type.name} saved!"
end
