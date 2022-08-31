# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :addressee, class_name: 'User'

  validates :sender_id, uniqueness: { scope: :addressee_id,
                                      message: 'Already have a relation' }

  validate :custom_uniqueness

  private

  def custom_uniqueness
    errors.add(:must, 'Already have a relation') if Relation.find_by(sender_id: addressee_id, addressee_id: sender_id).present?
  end
end
