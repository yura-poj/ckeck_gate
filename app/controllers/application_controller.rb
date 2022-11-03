# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    if current_user
      if current_user.class.to_s == 'User'
        redirect_to edit_type_user_path(current_user), alert: 'You have to select your type'
      else
        redirect_back(fallback_location: root_path, alert: 'You are not authorized to perform this action.')
      end
    else
      redirect_to new_user_session_path, alert: 'You need to log in'
    end
  end
end
