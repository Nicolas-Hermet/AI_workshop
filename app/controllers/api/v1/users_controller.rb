module Api
  module V1
    class UsersController < BaseController
      # CORRECTION : On définit une liste stricte d'attributs autorisés à l'export
      SAFE_FIELDS = %i[id name email role bio created_at].freeze

      def show
        @user = User.find(params[:id])
        render json: @user.as_json(only: SAFE_FIELDS)
      end

      def index
        @users = User.all
        render json: @users.as_json(only: SAFE_FIELDS)
      end
    end
  end
end