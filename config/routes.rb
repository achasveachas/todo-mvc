Rails.application.routes.draw do
  get 'items/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'

  resources :lists do
    resources :items
  end
end
