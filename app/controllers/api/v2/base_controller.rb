# frozen_string_literal: true

module Api
  module V2
    class BaseController < ApplicationController
      skip_before_action :verify_authenticity_token

      HMAC_SECRET = Rails.application.credentials[Rails.env.to_sym][:jwt][:secret]

      before_action :jwt_authorize

      rescue_from JWT::DecodeError, with: :not_authorized

      def current_resource_owner
        # Kid.find_by(nft: params[:nft])
        Kid.find(params[:user_id])
      end

      private

      def jwt_authorize
        JwtAuthService.new(params[:token]).decode
      end

      def not_authorized
        head 401
      end
    end
  end
end
