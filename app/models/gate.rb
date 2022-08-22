# frozen_string_literal: true

class Gate < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates_inclusion_of :enter, in: [true, false]

  def enter?
    enter
  end
end
