FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters rand(3..20) }
    password_confirmation {|user| user.password }
  end
end
