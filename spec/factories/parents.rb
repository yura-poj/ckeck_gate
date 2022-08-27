# frozen_string_literal: true

FactoryBot.define do
  factory :parent do
    email
    name { 'Vasya' }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { 1.minute.ago }
  end
end
