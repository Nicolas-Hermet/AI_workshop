class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    @board_note = BoardNote.order(:id).last
  end

  private

  def require_admin
    redirect_to root_path, alert: "Accès admin requis." unless current_user&.admin?
  end
end
