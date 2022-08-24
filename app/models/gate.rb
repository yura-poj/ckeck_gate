# frozen_string_literal: true

class Gate < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates_inclusion_of :enter, in: [true, false]
  validate :user_cannot_be_unverified

  def enter?
    enter
  end

  private

  def user_cannot_be_unverified
    errors.add(:user_verification, 'user must be verified') unless User.find(user_id).verify
  end
end
