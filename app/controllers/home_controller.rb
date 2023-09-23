class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:likeunlike]

  def index
    @menus = Menu.includes(:item_detail)
    @categories = Category.all
    if params[:category_id].present?
      @menus = @menus.where(item_details: {category_id: params[:category_id]})
    end
  end

  def likeunlike
    menu = Menu.find_by(id: params[:menu_id])
    like = Like.find_by(likeable_id: menu.id, user_id: current_user.id)
    if like.present?
      like.destroy
    else
      menu.likes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end
end
