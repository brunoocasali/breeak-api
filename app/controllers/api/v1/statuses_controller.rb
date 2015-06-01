module Api
  module V1
    class StatusesController < ApplicationController
      before_action :set_status, only: [:show ]#, :update, :destroy]

      def index
        @statuses = Status.all

        respond_with(@statuses)
      end

      def show
        respond_with(@status)
      end

      private

      def set_status
        @status = Status.find(params[:id])
      end
    end
  end
end
