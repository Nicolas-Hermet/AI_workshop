class ClientsController < ApplicationController
  def index
    authorize Client
    
    if params[:q].present?
      # CORRECTION : Utilisation d'une requête paramétrée pour éviter l'injection SQL
      @clients = Client.where("name LIKE ?", "%#{params[:q]}%")
    else
      @clients = Client.all
    end
  end

  def show
    @client = Client.find(params[:id])
    authorize @client
  end
end