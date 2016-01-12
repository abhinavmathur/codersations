Rails.application.routes.draw do

  namespace :admin do
    root 'dashboard#index'
    resources :categories, except: [:show]
    resources :dashboards, only: [:index]
  end


  resources :categories, only: [:index, :show]
  devise_for :users, controllers: { registrations: 'registrations' }
end
