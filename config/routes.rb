Rails.application.routes.draw do
  root 'pages#index'

  namespace :admin do
    root 'dashboard#index'
    resources :categories, except: [:show]
    resources :dashboards, only: [:index]
    resources :users
  end


  resources :categories, only: [:index, :show]
  resources :templates, except: :index
  devise_for :users, controllers: { registrations: 'registrations' }
end
