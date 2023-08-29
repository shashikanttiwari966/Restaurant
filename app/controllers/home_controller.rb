class HomeController < ApplicationController
  def index
    @items = ItemDetail.all
    if params[:category_id].present?
      @items = @items.where(category_id: params[:category_id])
    end
  end
end
