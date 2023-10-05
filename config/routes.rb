Rails.application.routes.draw do

  # devise_for :users
# admin routes.......................................
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

# user routes.......................................
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  root "home#index"
  get 'home/index'
  post 'likeunlike', to:"home#likeunlike"

  resources :restaurants do
    post :owner_login, on: :collection
  end

  namespace :users do
    resources :dashboard do
      post :add_card_item, to:"dashboard#add_card_item",on: :collection, as:"add_cart"
      delete :delete_items, to:"dashboard#delete_items",on: :collection
      post :card_qty, to:"dashboard#card_qty",on: :collection
      get :user_profile, to:"dashboard#user_profile",on: :collection
    end
  end
  
  namespace :restaurant do
    resources :owners
    resources :menus
  end
  # match '*unmatched', to: 'application#not_found_method', via: :all
end
