class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :check_url, :create_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # rescue_from ActionController::RoutingError, with: :not_found_method
 
  # def not_found_method
  #   render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  # end


  private

  def create_cart
    if signed_in?
      current_user.create_card() unless current_user.card.present?
    end
  end

  def check_url
    if signed_in? && request.path.eql?("/users/sign_in") 
      redirect_back(fallback_location: restaurant_owners_path)
    end
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :phone_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :fssi_number, :secret_code, :phone_number)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :fssi_number, :secret_code, :phone_number)}
  end

  # def authenticate_user!
  #   unless signed_in?
  #     flash[:alert] = "You need to sign in or sign up before continuing."
  #     redirect_back(fallback_location: root_path)
  #   end
  # end
 
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
