class DepartmentsController < ApplicationController
  def index
    @departments = Department.order(:name)
  end

  def show
    @department = Department.find(params[:id])
  end
end
