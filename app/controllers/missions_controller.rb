class MissionsController < ApplicationController
  def index
    @missions = Mission.all.includes(:client, :consultant)
  end

  def show
    @mission = Mission.find(params[:id])
    # Pundit va vérifier MissionPolicy#show?
    authorize @mission
  end

  def new
    @mission = Mission.new
    authorize @mission
    @clients = Client.all
  end

  def create
    @mission = Mission.new(mission_params.merge(consultant: current_user))
    authorize @mission
    if @mission.save
      redirect_to @mission, notice: "Mission créée."
    else
      @clients = Client.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    authorize @mission
    @clients = Client.all
  end

  def update
    @mission = Mission.find(params[:id])
    authorize @mission
    if @mission.update(mission_params)
      redirect_to @mission, notice: "Mission mise à jour."
    else
      @clients = Client.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :client_id, :hours, :hourly_rate, :private_notes)
  end
end
