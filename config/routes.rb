Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants do
        post :login, on: :collection
      end
      resources :users do
        post :login, on: :collection
      end
      resources :delivery_partners do
        post :login, on: :collection
      end
      resources :food_items
      resources :orders
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
