# frozen_string_literal: true

FactoryBot.define do
  factory :relation do
    addressee { parent }
    sender { kid }
  end
end
