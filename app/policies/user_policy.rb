# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin?

      scope.none
    end

    private

    attr_reader :user, :scope
  end

  def show?
    user.admin? || user == record
  end

  def index?
    user.admin?
  end

  def verify?
    user.admin? && user != record
  end

  def unverify?
    user.admin? && user != record
  end
end
