# frozen_string_literal: true

module Api
  module V1
    class ExitsController < Api::V1::BaseController
      def create
        @enter = Gate.create(user: current_resource_owner, enter: false)
        if @enter.persisted?
          head :created
        else
          head :unprocessable_entity
        end
      end
    end
  end
end

