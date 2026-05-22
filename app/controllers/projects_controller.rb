class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:client).order(created_at: :desc)
    @projects = @projects.where(status: params[:status]) if params[:status].present?
  end

  def show
    @project = Project.find(params[:id])
  end
end
