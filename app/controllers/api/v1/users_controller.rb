module Api
  module V1
    class UsersController < BaseController
      # On définit les champs publics que l'on accepte de renvoyer
      USER_PUBLIC_FIELDS = %i[id name email role bio].freeze

      def show
        @user = User.find(params[:id])
        render json: @user.as_json(only: USER_PUBLIC_FIELDS)
      end

      def index
        render json: User.all.as_json(only: USER_PUBLIC_FIELDS)
      end
    end
  end
end
