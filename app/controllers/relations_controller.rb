class RelationsController < ApplicationController
  def index
    authorize Relation
    @relations = policy_scope(Relation).includes(:parent, :kid)
  end

  def accept
    authorize Relation
  end

  def decline
    authorize Relation
  end
end
