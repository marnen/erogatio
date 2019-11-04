FactoryBot.define do
  factory :client do
    association :user
    name { Faker::Company.name }
  end
end
