# frozen_string_literal: true

class Parent < User
  has_many :kids, through: :relations
end
