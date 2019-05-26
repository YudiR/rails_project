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

# yudi_pizza = Item.create(
#     title: 'pizza slice',
#     price_cents: 55.00,
#     description: "yummy",
#     user_id: User.last.id
# )

# Faker::Number.between(0, 6)
uploader = ImageUploader.new(:store)
file = File.new(Rails.root.join('app/assets/images/seed/sharp.jpg'))
uploaded_file = uploader.upload(file)

100.times do 
    Item.create(
    title: Faker::Device.model_name,
    category:Faker::Number.between(0,7),
    description: 'good',
    image_data: uploaded_file.to_json ,
    price_cents: Faker::Number.between(10, 250) ,
    location: Faker::Address.state,
    user_id: User.last.id)
end



