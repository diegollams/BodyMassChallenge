Rails.application.routes.draw do
  resources :body_mass_histories, only: [:destroy, :index, :create]
  devise_for :users
  root 'mass_calculator#index'

end
