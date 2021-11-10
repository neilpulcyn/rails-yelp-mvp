# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

5.times do
  restaurant = Restaurant.create!( # we use ! on create so that it throws an error message if there's an issue
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: %w[chinese italian japanese french belgian].sample
  )
  5.times do
    review = restaurant.reviews.create!(
      content: Faker::Food.description,
      rating: (0..5).to_a.sample
    )
  end
  puts "Creating restaurant with id #{restaurant.id}"
end

puts 'Finished!'
