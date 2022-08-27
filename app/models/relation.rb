# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :kid
  belongs_to :parent
end
