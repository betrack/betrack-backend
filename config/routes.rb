Rails.application.routes.draw do
  resources :barrel_statuses
  resources :barrels
  resources :stores
  resources :transports
  get 'main' => 'main#index'
  get 'active_markers' => 'main#active_markers'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
