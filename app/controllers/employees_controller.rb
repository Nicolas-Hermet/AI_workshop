class EmployeesController < ApplicationController
  def index
    @employees = Employee.includes(:department).order(:last_name)
    @employees = @employees.where(department_id: params[:department_id]) if params[:department_id].present?
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
