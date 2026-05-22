module Api
  module V1
    class TimesheetsController < BaseController
      def index
        timesheets = Timesheet.all
        timesheets = timesheets.where(employee_id: params[:employee_id]) if params[:employee_id].present?
        render json: timesheets
      end

      def show
        render json: Timesheet.find(params[:id])
      end
    end
  end
end
