# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :addressee, class_name: 'User'

end
