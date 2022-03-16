Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :locations
  # resources :items
  # resources :menu_items
  get '/stores', to: 'store#get_nearby_stores'
  get '/stores/:store_id/menu', to: 'store#get_menu'

end
