class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "Profil mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # CORRECTION : Seul un admin peut modifier le paramètre :role
    if current_user.admin?
      params.require(:user).permit(:name, :email, :bio, :role)
    else
      params.require(:user).permit(:name, :email, :bio)
    end
  end
end