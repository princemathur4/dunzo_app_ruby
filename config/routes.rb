Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :locations
  # resources :items
  # resources :menu_items
  get '/stores', to: 'store#get_nearby_stores'
  get '/stores/:store_id/menu', to: 'store#get_menu'
  post '/cart/menu_items/:menu_item_id', to: 'cart#add_menu_item_to_cart'
  post '/checkout', to: 'order#checkout'
  post '/complete_payment', to: 'order#complete_payment'
end
