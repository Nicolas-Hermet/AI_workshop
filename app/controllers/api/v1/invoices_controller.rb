module Api
  module V1
    class InvoicesController < BaseController
      INVOICE_FIELDS = %i[id mission_id amount_cents status created_at].freeze

      def index
        render json: Invoice.all.as_json(only: INVOICE_FIELDS)
      end

      def show
        invoice = Invoice.find(params[:id])
        render json: invoice.as_json(only: INVOICE_FIELDS)
      end
    end
  end
end
