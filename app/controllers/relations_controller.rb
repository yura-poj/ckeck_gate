# frozen_string_literal: true

class RelationsController < ApplicationController
  def index
    authorize Relation
    @relations = policy_scope(Relation)&.includes(:sender, :addressee)
  end

  def destroy
    authorize relation
    flash[:success] = 'Relation was successfully destroyed' if relation.destroy
    redirect_back fallback_location: root_path
  end

  def create
    authorize addressee, policy_class: RelationPolicy
    flash[:success] = 'Relation was successfully send' if Relation.create(addressee: addressee, sender: current_user)
    redirect_back fallback_location: root_path
  end

  def accept
    authorize relation
    flash[:success] = 'Relation was successfully accepted' if relation.update!(read: true, confirm: true)
    redirect_back fallback_location: root_path
  end

  def decline
    authorize relation
    flash[:success] = 'Relation was successfully declined' if relation.update!(read: true, confirm: false)
    redirect_back fallback_location: root_path
  end

  private

  def relation
    @relation ||= Relation.find(params[:id])
  end

  def addressee
    @addressee ||= User.find(params[:addressee_id])
  end
end
