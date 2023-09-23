class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  before_action :check_fssinumber, only: [:new]

  def new
    super
  end

  def create
    return redirect_to restaurant_owners_path, notice:"You are already login as Restaurant Owner" if signed_in?
    self.resource = warden.authenticate!(auth_options)
    # self.resource = warden.authenticate!({:scope=>:user, :recall=>"users/sessions#new"})
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(:user, resource)
    redirect_to restaurant_owners_path, notice:"You have login as Restaurant Owner"
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(:user))
    redirect_to root_path, notice:"You are logout!"
    # set_flash_message! :notice, :signed_out if signed_out
  end

  private

  def check_fssinumber
    redirect_to root_path, notice:"You are not authorized to perform this action, please click on login button." unless params[:login].present?
  end
end
