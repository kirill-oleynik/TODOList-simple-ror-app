# frozen_string_literal: true

FactoryBot.define do
  factory :task do |f|
    f.title { Faker::Lorem.sentence }
    f.ppriority { rand(10) }
    f.done { [true, false].sample }
  end
end
