FactoryBot.define do
  factory :work_unit do
    date { Faker::Date.backward 365 }
    description { Faker::Lorem.sentence }
    hours { rand(1..10).hours } # TODO: support minutes too
    association :user
  end
end
