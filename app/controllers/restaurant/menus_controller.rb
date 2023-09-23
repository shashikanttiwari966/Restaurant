class Restaurant::MenusController < ApplicationController
  before_action :find_restaurant

  def create
    @menu = @restaurant.menus.create(menu_param)
    if @menu.save
      redirect_to restaurant_owners_path, notice:"Item Inserted in Menu"
    end
  end

  def show
    @menu = Menu.find_by_id(params[:id])
  end

  def update
    @menu = Menu.find_by_id(params[:id])
    if @menu.update(menu_param)
      redirect_to restaurant_owner_path(@restaurant), notice:"Item Updated in Menu"
    end
  end

  private

  def menu_param
    params.require(:menu).permit(:restaurant_id, :item_detail_id, :price, :available, :availability_status, :description)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by_id(params[:menu][:restaurant_id])
  end
end
