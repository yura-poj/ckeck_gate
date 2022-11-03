# frozen_string_literal: true

class RelationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return scope.all if user.is_a?(Admin)

      scope.where(sender: user).or(scope.where(addressee: user))
    end
  end

  def index?
    check_type

    true
  end

  def create?
    check_type
    # record is a addressee
    return false if user.is_a?(Admin) || record.is_a?(Admin)
    return false if user.instance_of?(record.class)

    true
  end

  def destroy?
    check_type

    return true if user.is_a?(Admin)
    return true if user == record.sender

    false
  end

  def accept?
    check_type

    return false if user.is_a?(Admin)
    return false if user == record.sender
    return false if record.addressee != user

    true
  end

  def decline?
    check_type

    return false if user.is_a?(Admin)
    return false if user == record.sender
    return false if record.addressee != user

    true
  end
end
