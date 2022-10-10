require 'faker'


FactoryBot.define do
  factory :dog do
    breed { Faker::Creature::Dog.breed }
    weight_imperial { "#{rand(1..5.0).round(1)} - #{rand(5..10.0).round(1)}" }
    weight_metric { "#{rand(1..2.0).round(1)} - #{rand(2..6.0).round(1)}" }
    height_imperial { "#{rand(1..2.0).round(1)} - #{rand(2..6.0).round(1)}" }
    height_metric { "#{rand(2..5.0).round(1)} - #{rand(5..12.0).round(1)}" }
    bred_for { Faker::Lorem.sentence }
    breed_group { Faker::Creature::Dog.sound }
    life_span { "#{rand(9..12)} - #{rand(12..15)} years" }
    temperament { Faker::Lorem.sentence }
  end
end
