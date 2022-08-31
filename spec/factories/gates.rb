FactoryBot.define do
  factory :gate do
    user { kid }
    enter { true }
  end
end
