class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_user, only:[:owner_login]

  def index
    
  end

  def owner_login
    path = @user.present? ? user_session_path(login: params[:fssi_number]) : root_path
    message = @user.present? ? "Please login here." : "You entered wrong fssi number or secret code."
    redirect_to path, notice: message
  end

  private

  def check_user
    @user = @user || User.find_by(fssi_number: params[:fssi_number]) if params[:fssi_number].present?
  end
end
