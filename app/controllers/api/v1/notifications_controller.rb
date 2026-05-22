module Api
  module V1
    class NotificationsController < BaseController
      def index
        render json: current_user.notifications.order(created_at: :desc)
      end

      def show
        render json: current_user.notifications.find(params[:id])
      end
    end
  end
end
