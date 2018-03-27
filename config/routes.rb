Rails.application.routes.draw do
  root 'locations#index'

  resources :locations, only: [:index, :new, :create]
end
