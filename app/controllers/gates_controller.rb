class GatesController < ApplicationController
  helper_method :gates

  def index
    @gates = policy_scope(Gate)
    authorize @gates
  end

  private

  def gates
    @gates = Gate.all
  end

end
