module Api
  module V1
    class DocumentsController < BaseController
      def index
        documents = Document.all
        documents = documents.where(doc_type: params[:doc_type]) if params[:doc_type].present?
        render json: documents
      end

      def show
        render json: Document.find(params[:id])
      end
    end
  end
end
