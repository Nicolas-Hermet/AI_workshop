module Api
  module V1
    class MissionsController < BaseController
      MISSION_FIELDS = %i[id title client_id consultant_id hours hourly_rate created_at].freeze

      def index
        render json: Mission.all.as_json(only: MISSION_FIELDS)
      end

      def show
        mission = Mission.find(params[:id])
        render json: mission.as_json(only: MISSION_FIELDS)
      end
    end
  end
end
