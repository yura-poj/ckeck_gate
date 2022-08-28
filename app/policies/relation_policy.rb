class RelationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return scope.all if user.is_a?(Admin)
      return scope.where(kid: user) if user.is_a?(Kid)

      scope.where(parent: user) if user.is_a?(Parent)
    end
  end

  def index?
    true
  end

  def accept?
    return false if user.is_a?(Admin)

    true
  end

  def decline?
    return false if user.is_a?(Admin)

    true
  end
end
