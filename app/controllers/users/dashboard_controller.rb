class Users::DashboardController < ApplicationController
  require "rubygems"
  require "braintree"

  before_action :authenticate_user!
  before_action :find_menu, only: [:add_card_item]
  before_action :create_token, only: [:index]
  # before_action :check_role

  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
  Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
  Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']

  def index
    @card_item = current_user.card.card_items
  end

  def user_profile
    @current_user = current_user
  end

  def add_card_item
    card_item = current_user.card.card_items.find_or_initialize_by(menu_id: @menu.id, price: @menu.price)
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

  def card_qty
    @card_item = CardItem.find_by(id: params[:id])
    qty = @card_item.qty.next if params[:type].eql?("increse")
    qty = @card_item.qty.pred if params[:type].eql?("decrese")
    qty = params[:qty].to_i if params[:type].eql?("qty")

    @card_item.update(qty: qty, price: cal_price(qty))
    if params[:type].eql?("decrese")
      @card_item.destroy if @card_item.qty.eql?(0)
    end
    @card_item = current_user.card.card_items
  end

  private

  def create_token
    begin
      @token = current_user.customer_id.present? ? $gateway.client_token.generate(:customer_id => current_user.customer_id) : Braintree::ClientToken.generate
    rescue Exception => e
      redirect_to root_path, notice:"#{e.message}"
    end
  end

  def cal_price(qty)
    qty * @card_item.menu.price
  end

  def find_menu
    @menu = Menu.find_by(id: params[:menu_id])
  end

  def check_role
    redirect_to root_path, notice:"You need to sign or signup as User." unless current_user.user?
  end
end
