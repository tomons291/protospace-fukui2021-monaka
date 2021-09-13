FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    profile {Faker::Lorem.sentence}
    affiliation {Faker::Lorem.words}
    position {Faker::Lorem.words}
  end
end