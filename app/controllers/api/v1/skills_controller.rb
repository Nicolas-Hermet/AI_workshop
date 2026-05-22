module Api
  module V1
    class SkillsController < BaseController
      def index
        render json: Skill.order(:category, :name)
      end

      def show
        render json: Skill.find(params[:id])
      end
    end
  end
end
