# Creating Admin...
Customer.create!(firstname: "John", lastname: "Doe", email: "admin@gmail.com",
  password: "admin123", admin: true) unless Customer.find_by(email: "admin@gmail.com")

DESCRIPTIONS = [
  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
  "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...",
  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in"\
    "some form, by injected humour, or randomised words which don't look even slightly believable.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical"\
    "Latin literature from 45 BC, making it over 2000 years old."
]

def description
  ::DESCRIPTIONS[rand(4)]
end

# Creating Products...
products = [
  { name: "iPhone 6", description: description, price: 350 },
  { name: "iPhone 6s", description: description, price: 450 },
  { name: "iPhone 7", description: description, price: 550 },
  { name: "iPad", description: description, price: 220 },
  { name: "Samsung Galaxy Tab", description: description, price: 150 },
  { name: "Samsung Galaxy S7", description: description, price: 500 },
  { name: "Apple Watch", description: description, price: 300 },
  { name: "Samsun Galaxy Gear S", description: description, price: 200 },
  { name: "Microsoft Surface Pro", description: description, price: 900 },
  { name: "Sony PS4", description: description, price: 400 },
  { name: "Xbox One", description: description, price: 350 }
]

products.each do |product|
  Product.find_or_create_by(product.merge({ status: true }))
end
