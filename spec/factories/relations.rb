# frozen_string_literal: true

FactoryBot.define do
  factory :relation do
    kid
    parent
    sender { parent }
  end
end
