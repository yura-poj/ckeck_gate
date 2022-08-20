# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authenticate_user!
  helper_method :user
  helper_method :users

  def show
    authorize user
  end

  def index
    authorize users
  end

  private

  def users
    User.all
  end

  def user
    return User.find(params[:id]) if params[:id]

    current_user
  end
end
