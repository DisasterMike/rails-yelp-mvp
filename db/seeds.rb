# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# FOOD_IMG = {
#   japanese: "images/Japanese.jpg",
#   belgian: "images/belgian.jpg",
#   french:  "images/french.jpeg",
#   chinese:  "images/chinese.jpg",
#   italian:  "images/italian.jpg"
# }

puts "Generating 5 restaurants..."

5.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Name.name
  restaurant.address = Faker::Address.full_address
  restaurant.phone_number = Faker::Number.number(digits: 11)
  restaurant.category = %w[chinese italian japanese french belgian].sample
  if restaurant.save
    puts "Added a restaurant called #{restaurant.name} to the database"
  else
    puts "Couldn't add #{restaurant.name} to the database"
  end
end

puts "Finished adding restaurants!"
