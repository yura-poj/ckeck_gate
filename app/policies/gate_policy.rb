# frozen_string_literal: true

class GatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return scope.all if user.is_a?(Admin)

      scope.where(user: user)
    end
  end

  def index?
    check_type
    
    true
  end
end
