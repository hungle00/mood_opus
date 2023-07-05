class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to edit_profile_path, notice: 'Your account has been updated'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :avatar)
  end								
end


