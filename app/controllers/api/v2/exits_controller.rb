# frozen_string_literal: true

module Api
  module V2
    class ExitsController < Api::V2::BaseController
      def create
        @exit = Gate.create(user: current_resource_owner, enter: false)
        if @exit.persisted?
          head :created
        else
          head :unprocessable_entity
        end
      end
    end
  end
end
