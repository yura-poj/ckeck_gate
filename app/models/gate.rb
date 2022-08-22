class Gate < ApplicationRecord
  belongs_to :user

  def enter?
    enter
  end
end
