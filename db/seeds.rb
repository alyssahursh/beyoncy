# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'CSV'

def to_bool(string)
  if string.downcase == "true"
    return true
  else
    return false
  end
end

# seed Categories
CSV.foreach('seed_csvs/categories.csv') do |line|
 Category.create(name: line[0])
end

# seed Products

CSV.foreach('seed_csvs/products.csv') do |line|
 Product.create(name: line[0], description: line[1], price: line[2].to_i, picture: line[3], inventory_qty: line[4].to_i, active: to_bool(line[5]), category_id: line[6].to_i)
end
