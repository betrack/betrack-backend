Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :barrels
  resources :stores, :transports do
    resources :barrels, :only => :index
  end

  get 'main' => 'main#index'
  get 'active_markers' => 'main#active_markers'
  root 'main#index'
end
