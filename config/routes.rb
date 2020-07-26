Rails.application.routes.draw do
  devise_for :users
  
  get 'trips/index'

  resources :trips do
    member do
      resources :trip_stops
    end
  end
  
  root 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
