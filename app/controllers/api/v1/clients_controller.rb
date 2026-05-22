module Api
  module V1
    class ClientsController < BaseController
      def index
        render json: Client.order(:name)
      end

      def show
        render json: Client.find(params[:id])
      end
    end
  end
end
