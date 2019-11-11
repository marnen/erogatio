FactoryBot.define do
  factory :work_unit do
    transient { user { nil } } # TODO: consider getting rid of this

    date { Faker::Date.backward 365 }
    description { Faker::Lorem.sentence }
    hours { rand(1..10).hours } # TODO: support minutes too
    pay { (rand(1000..20_000) / 100).round 2 }
    payment_due { date + rand(2..60).days }
    client

    after(:create) do |work_unit, evaluator|
      user = evaluator.user
      work_unit.update_attributes!(client: create(:client, user: user)) if user && (work_unit.user != user)
    end
  end
end
