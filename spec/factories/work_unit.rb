FactoryBot.define do
  factory :work_unit do
    transient { paid { false } }

    date { Faker::Date.backward 365 }
    description { Faker::Lorem.sentence }
    hours { rand(1..10).hours } # TODO: support minutes too
    pay { (rand(1000..20_000) / 100).round 2 }
    payment_due { date + rand(2..60).days }
    client

    after(:create) do |work_unit, evaluator|
      if evaluator.paid
        FactoryBot.create :payment, work_unit: work_unit, amount: work_unit.pay
      end
    end
  end
end
