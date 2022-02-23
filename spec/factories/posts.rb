# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { FFaker::Book.description[0..255] }
    user { build(:user) }
  end
end
