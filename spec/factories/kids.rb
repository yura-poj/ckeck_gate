# frozen_string_literal: true

FactoryBot.define do
  factory :kid do
    email
    name { 'Vasya' }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { 1.minute.ago }
  end
end
