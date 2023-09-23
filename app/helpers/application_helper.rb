module ApplicationHelper

  def get_total_price(card)
    get_item_price(card) + get_gst(card) + get_tax(card) + 40
  end

  def get_item_price(card)
    card.card_items.joins(:menu).pluck(:price).sum
  end

  def get_gst(card)
    card.card_items.joins(:menu).map{|card| (card.menu.price / 100) * card.menu.item_detail.category.gst}.sum
  end

  def get_tax(card)
    card.card_items.joins(:menu).map{|card| (card.menu.price / 100) * card.menu.item_detail.category.tax}.sum
  end
end
