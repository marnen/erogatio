FactoryBot.define do
  factory :work_unit do
    date { Faker::Date.backward 365 }
    description { Faker::Lorem.sentence }
    hours { rand(1..600).minutes }
    association :user
  end
end
