FactoryBot.define do
  factory :payment do
    amount { (rand(1000..20_000) / 100).round 2 }
    date { Faker::Date.backward 365 }
    association :work_unit
  end
end
