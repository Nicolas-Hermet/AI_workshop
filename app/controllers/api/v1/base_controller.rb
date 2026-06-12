module Api
  module V1
    class BaseController < ActionController::API
      # CORRECTION 1 : Hériter de ActionController::API et non ApplicationController 
      # pour ne pas dépendre des sessions/cookies (qui causent la faille CSRF ici).
      
      include Pundit::Authorization
      
      # CORRECTION 2 : Authentification par Token API
      before_action :authenticate_api_user!
      
      # CORRECTION 3 : Forcer les développeurs à utiliser Pundit dans l'API
      after_action :verify_authorized, except: :index
      after_action :verify_policy_scoped, only: :index

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def authenticate_api_user!
        token = request.headers['Authorization']&.split(' ')&.last
        @current_user = User.find_by(api_token: token)
        
        render json: { error: "Non autorisé" }, status: :unauthorized unless @current_user
      end

      def current_user
        @current_user
      end

      def user_not_authorized
        render json: { error: "Accès refusé" }, status: :forbidden
      end
    end
  end
end