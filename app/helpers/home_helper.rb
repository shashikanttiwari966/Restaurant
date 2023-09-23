module HomeHelper

  def get_background(cat)
    if cat.item_details.present?
      cat.item_details.first.image.attached? ? "background-image: url(#{request.base_url}#{url_for(cat.item_details.first.image)});background-size: cover;" : "red"
    else
      "red"
    end
  end

  def getLikeItemByUser(menu, user_id)
    name = Like.find_by(likeable_id: menu.id, user_id: user_id).present? ? "<i class='fa-solid fa-heart' style='color: #e92907;'></i>" : "<i class='fa-regular fa-heart'></i>"
    link_to name.html_safe, likeunlike_path(menu_id: menu.id), method: :post
  end

  def get_link_card(menu)
    CardItem.find_by(menu_id: menu.id).present? ? 'Remove to Card' : 'Add to Card'
  end

  def get_card_items_class(user)
    user&.card&.card_items.present? ? "d-block" : "d-none"
  end

  def get_card_items(user)
    user&.card&.card_items.present? ?  user.card.card_items.count : 0
  end
end
