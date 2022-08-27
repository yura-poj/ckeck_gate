# frozen_string_literal: true

class Kid < User
  has_many :parents, through: :relations
end
