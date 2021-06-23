Rails.application.routes.draw do
  # devise_for :users

  # rutas en comun entre versiones
  # concern :base_api do
  #   post 'users/register', to: 'users#register'
  #   post 'users/login', to: 'users#login'
  # end

  post 'users/register', to: 'users#register'
  post 'users/login', to: 'users#login'

  namespace :V1 do
    # concerns :base_api
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
