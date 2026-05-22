module Api
  module V1
    class UsersController < BaseController
      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def index
        render json: User.all
      end
    end
  end
end
