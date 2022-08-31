# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.is_a?(Admin)

      scope.none
    end

    private

    attr_reader :user, :scope
  end

  def show?
    user.is_a?(Admin) || user == record
  end

  def index?
    user.is_a?(Admin)
  end

  def verify?
    user.is_a?(Admin) && user != record
  end

  def unverify?
    user.is_a?(Admin) && user != record
  end
end
