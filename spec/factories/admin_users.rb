# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do |f|
    f.name { Faker::Name.unique.name }
    f.email { Faker::Internet.unique.email }
    f.encrypted_password { Faker::Lorem.unique.word }
  end
end
