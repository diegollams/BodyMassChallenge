Rails.application.routes.draw do
  devise_for :users
  root 'mass_calculator#index'

end
