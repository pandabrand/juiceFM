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
    zip          12345
    state        "ST"
  end
end
