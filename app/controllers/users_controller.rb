# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authenticate_user!
  helper_method :user
  helper_method :users

  def show
    authorize user
    @relations = Relation.where(addressee: user, read: false)
  end

  def index
    authorize users
  end

  def verify
    authorize user
    if user.update(verify: true)
      flash[:success] = 'User successfully verify'
    else
      flash[:alert] = "User doesn't verify"
    end
    redirect_back fallback_location: root_path
  end

  def unverify
    authorize user
    if user.update(verify: false)
      flash[:success] = 'User successfully unverify'
      redirect_back fallback_location: root_path, success: 'User successfully unverify'
    else
      flash[:alert] = "User doesn't unverify"
      redirect_back fallback_location: root_path, alert: "User doesn't unverify"
    end
  end

  def edit_type; end

  def update
    if user.update(user_params)
      flash[:success] = 'Successfuly updated'
      redirect_to root_path
    else
      flash[:alert] = 'User does not updated'
    end
  end

  private

  def users
    User.all
  end

  def user
    return User.find(params[:id]) if params[:id]

    current_user
  end

  def user_params
    params.require(:user).permit(:type)
  end
end
