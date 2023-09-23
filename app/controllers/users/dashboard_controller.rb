class Users::DashboardController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_role

  def index
    @card_item = current_user.card.card_items
  end

  def add_card_item
    card_item = current_user.card.card_items.find_or_initialize_by(menu_id: params[:menu_id])
    card_item.new_record? ? card_item.save : card_item.destroy 
    redirect_to root_path
  end

  def delete_items
    @menus = Menu.includes(:item_detail)
    current_user.card.card_items.destroy_all
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, notice: "Card item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def check_role
    redirect_to root_path, notice:"You need to sign or signup as User." unless current_user.user?
  end
end
