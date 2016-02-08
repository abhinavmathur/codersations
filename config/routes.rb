Rails.application.routes.draw do
  root 'static#index'

  namespace :admin do
    root 'dashboard#index'
    resources :categories, except: [:show]
    resources :dashboards, only: [:index]
    resources :users
  end


  resources :categories, only: [:index, :show] do
    resources :templates, except: :index do
      resources :infopages, except: :index
    end
  end

  resources :categories, only: [:index, :show] do
    resources :tutorials, except: :index do
      member do
=begin
        put '/add_member' => 'tutorials#add_member'
        put '/remove_member' => 'tutorials#remove_member'
=end
        put '/like', to: 'tutorials#like'
        put '/dislike', to: 'tutorials#dislike'
      end
    end
  end


  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: :show do
    member do
      put '/follow', to: 'users#follow'
      put '/unfollow', to: 'users#unfollow'
    end
  end
end
