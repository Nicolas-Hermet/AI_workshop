module Api
  module V1
    class AuditEventsController < BaseController

      def index
        render json: AuditEvent.recent.limit(200)
      end

      def show
        render json: AuditEvent.find(params[:id])
      end
    end
  end
end
