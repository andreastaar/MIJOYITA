# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Product.destroy_all
# User.create(email: "vendedor@joyita.com", password: "123456")

# mijoyita_names = [
#   "Elegant Necklace", "Diamond Ring", "Gold Bracelet", "Silver Earrings",
#   "Pearl Pendant", "Ruby Brooch", "Sapphire Cufflinks", "Emerald Anklet",
#   "Amethyst Tiara", "Topaz Necklace", "Opal Ring", "Quartz Bracelet",
#   "Onyx Earrings", "Turquoise Pendant", "Garnet Brooch", "Jade Cufflinks",
#   "Amber Anklet", "Aquamarine Tiara", "Lapis Lazuli Necklace", "Moonstone Ring",
#   "Citrine Bracelet", "Peridot Earrings", "Coral Pendant", "Spinel Brooch",
#   "Tanzanite Cufflinks"
# ]

# mijoyita_names.each do |name|
#   Product.create(
#     name: name,
#     price: rand(50..500), # Precio aleatorio entre 50 y 500
#     comment: "This is a beautiful #{name.downcase} perfect for any occasion.",
#     user_id: User.last.id
#   )
# end

user = User.create!(name: "John Doe", email: "john@example.com")
product = Product.create!(name: "Aretes de Oro" price: 110) 
user.avatar.attach(io: File.open(Rails.root.join('db', 'seeds', 'images', 'sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpg') puts "User created with attached avatar image!"
