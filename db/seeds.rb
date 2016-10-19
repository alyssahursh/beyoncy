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

# seed Reviews
CSV.foreach('seed_csvs/reviews.csv') do |line|
  review = Review.create(subject: line[0], body: line[1], rating: line[2], user_id: line[3].to_i, product_id: line[4].to_i)
  if review.valid?
    puts "Review #{review.subject} created sucessfully."
  else
    puts "Review #{review.subject} failed. Errors: #{review.errors}"
  end
end

# seed Categories
CSV.foreach('seed_csvs/categories.csv') do |line|
  category = Category.create(name: line[0])
  if category.valid?
    puts "Category #{category.name} created sucessfully."
  else
    puts "Category #{category.name} failed. Errors: #{category.errors}"
  end
end

# seed Products

CSV.foreach('seed_csvs/products.csv') do |line|
 product = Product.create(name: line[0], description: line[1], price: line[2].to_i, picture: line[3], inventory_qty: line[4].to_i, active: to_bool(line[5]), category_id: line[6].to_i)

 if product.valid?
   puts "Product #{product.name} created sucessfully."
 else
   puts "Product #{product.name} failed. Errors: #{product.errors}"
 end
end
