Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :barrels do
    collection do
      post 'update_status'
    end
    resources :barrel_statuses
  end
  resources :stores, :transports do
    resources :barrels, :only => :index
  end

  put 'update_owner' => 'application#update_owner'
  get 'main' => 'main#index'
  get 'active_markers' => 'main#active_markers'
  root 'main#index'
end
