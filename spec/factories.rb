FactoryGirl.define do
  factory :user, :class => User do
    first_name   Faker::Name.first_name
    last_name    Faker::Name.last_name
    email        Faker::Internet.email
    is_admin     false
    address_one  Faker::Address.street_address
    address_two  Faker::Address.secondary_address
    phone        Faker::PhoneNumber.phone_number
    city         Faker::Address.city
    zip          Faker::Address.zip
    state        Faker::Address.state_abbr
    password     Faker::Internet.password
  end

  factory :admin, :class => User do
    first_name   Faker::Name.first_name
    last_name    Faker::Name.last_name
    email        Faker::Internet.email
    is_admin     true
    address_one  Faker::Address.street_address
    address_two  Faker::Address.secondary_address
    phone        Faker::PhoneNumber.phone_number
    city         Faker::Address.city
    zip          Faker::Address.zip
    state        Faker::Address.state_abbr
    password     Faker::Internet.password
  end

  factory :product, :class => Product do |p|
    p.name         Faker::Commerce.product_name
    p.ingredient   Faker::Commerce.department(3).split(",")
    p.description  Faker::Company.bs
    p.price        Faker::Commerce.price
    p.type         Faker::Commerce.department(1)
    p.category     Faker::Commerce.department(1)
    p.inventories  {[FactoryGirl.build(:inventory)]}

  end

  factory :inventory, :class => Inventory do
    qty           Faker::Number.digit
  end
end
