# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    user { nil }
    title { Faker::Book.title }
    description { Faker::Book.title }
  end
end
