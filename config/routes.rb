Rails.application.routes.draw do
  get 'trips/index'

  root 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
