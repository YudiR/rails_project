User.delete_all
Item.delete_all

 yudi = User.create(
    name: 'yudi',
    email: 'yudrose@gmail.com'
)

# yudi.items.create( title: 'frech fries',
# price: 55,
# description: "yummy",)

yudi_pizza = Item.create(
    title: 'pizza slice',
    price: 55,
    description: "yummy",
    user_id: User.last
)

