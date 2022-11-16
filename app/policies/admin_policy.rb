# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    user.is_a?(Admin) || user == record
  end

  def verify?
    user.is_a?(Admin)
  end

  def unverify?
    user.is_a?(Admin)
  end
end
