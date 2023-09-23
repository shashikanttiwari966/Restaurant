module Restaurant::OwnersHelper

  def select_items_resto(restaurant)
    items = ItemDetail.all
    resto_items = ItemDetail.joins(:menus, :restaurants).where('menus.restaurant_id =?', restaurant.id)
    items = items.excluding(resto_items).map{|item| [item.name, item.id]}
  end
end
