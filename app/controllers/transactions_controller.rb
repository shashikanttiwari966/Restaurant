class TransactionsController < ApplicationController
  # include ApplicationHelper
  skip_before_action :verify_authenticity_token, :only => :create

  def create
    begin
      @result = $gateway.transaction.sale(amount: helpers.get_total_price(current_user.card), payment_method_nonce: params[:payment_method_nonce])
      if @result.success?
        create_order
        current_user.card.card_items.destroy_all
        redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
      else
        gon.client_token = generate_client_token
        render users_dashboard_index_path, notice: "Something went wrong while processing your transaction. Please try again!"
      end   
    rescue StandardError => e
      redirect_to root_url, notice: "#{e.message}"
    end
  end

  private

  def create_order
    order_params[:order_date] = DateTime.now
    order_params[:status] = @result.success? ? "Paid" : "Created"
    order = Order.create(order_params)
    card.card_items.each{|item| order.menus_orders.create(menu: item.menu)}
  end

  def order_params
    params.permit(:order_date, :status, :discount_price, :total_price, :city, :delivery_address)
  end

  def generate_client_token
     $gateway.client_token.generate
  end
end
