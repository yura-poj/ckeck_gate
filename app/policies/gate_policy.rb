class GatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return scope.all if user.admin?

      scope.where(user: user)
    end
  end

  def index?
    true
  end
end
