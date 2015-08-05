FactoryGirl.define do
  factory :user, :class => User do
    first_name   "John"
    last_name    "Doe"
    email        "nobody@nowhere.net"
    is_admin     false
    address_one  "1234 Fake Ave."
    address_two  "Apt 3f"
    phone        "123-123-1234"
    city         "Anytown"
    zip          "12345"
    state        "ST"
    password     "fakepassword"
  end

  factory :product, :class => Product do |p|
    p.name         "WGRN"
    p.ingredient   ['apple','carrots','tomato']
    p.description  "This is the most delicious juice you have ever tasted."
    p.price        12.00
    p.type         "Vegetable"
    p.category     "Juices"
    p.inventories  {[FactoryGirl.build(:inventory)]}

  end

  factory :inventory, :class => Inventory do
    qty           15
  end
end
