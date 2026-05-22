module Api
  module V1
    class LeadsController < BaseController
      def index
        leads = Lead.all
        leads = leads.where(status: params[:status]) if params[:status].present?
        render json: leads
      end

      def show
        render json: Lead.find(params[:id])
      end
    end
  end
end
