class RelationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return scope.all if user.is_a?(Admin)

      scope.where(sender: user).or(scope.where(addressee: user))
    end
  end

  def index?
    true
  end

  def create?
    #record is a addressee
    return false if user.is_a?(Admin) || record.is_a?(Admin)
    return false if user.class == record.class

    true
  end

  def destroy?
    return true if user.is_a?(Admin)
    return true if user == record.sender

    false
  end

  def accept?
    return false if user.is_a?(Admin)
    return false if user == record.sender
    return false if record.addressee != user

    true
  end

  def decline?
    return false if user.is_a?(Admin)
    return false if user == record.sender
    return false if record.addressee != user

    true
  end
end
