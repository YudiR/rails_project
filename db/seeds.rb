User.delete_all
Item.delete_all

 yudi = User.create(
    name: 'yudi',
    email: 'yudrose@gmail.com',
    password: 'yudi'
)


# yudi.items.create( title: 'frech fries',
# price: 55,
# description: "yummy",)

yudi_pizza = Item.create(
    title: 'pizza slice',
    price: 55,
    description: "yummy",
    user_id: User.last.id
)

# Faker::Number.between(0, 6)

50.times do 
    Item.create(
    title: Faker::Device.model_name,
    category:Faker::Device.manufacturer,
    description: 'very good condtion',
    price:  Faker::Commerce.price ,
    location: Faker::Address.city,
    user_id: User.last.id)
end


