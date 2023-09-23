class Restaurant::OwnersController < ApplicationController
  before_action :authenticate_user!
  def index
    @restaurants = current_user.restaurants
    # @restaurant = current_user.restaurants.new()
  end

  def create
    @restaurant = current_user.restaurants.build(resta_params)
    if @restaurant.save
      redirect_to restaurant_owners_path
    end
  end

  def show
    @restaurant = current_user.restaurants.find_by(id: params[:id])
    @menus = @restaurant.menus
  end

  def update
    @restaurant = current_user.restaurants.find_by(id: params[:id])
    if @restaurant.update(resta_params)
      redirect_to restaurant_owners_path
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find_by(id: params[:id])
    @restaurant.destroy!
    redirect_to restaurant_owners_path, notice:"Your restaurant deleted!"
  end

  private

  def resta_params
    params.require(:restaurant).permit(:name, :address, :opened_on, :open_time, :close_time, :image)
  end
end
