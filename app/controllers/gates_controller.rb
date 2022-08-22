# frozen_string_literal: true

class GatesController < ApplicationController
  helper_method :gates

  def index
    authorize Gate
    @gates = policy_scope(Gate)
  end

  private

  def gates
    @gates = Gate.all
  end
end
