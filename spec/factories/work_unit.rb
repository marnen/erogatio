FactoryBot.define do
  factory :work_unit do
    transient { user { nil } }

    date { Faker::Date.backward 365 }
    description { Faker::Lorem.sentence }
    hours { rand(1..10).hours } # TODO: support minutes too
    pay { (rand(1000..20_000) / 100).round 2 }
    payment_due { date + rand(2..60).days }
    client

    after(:create) do |work_unit, evaluator|
      work_unit.update_attributes!(client: create(:client, user: evaluator.user)) if evaluator.user
    end
  end
end
