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
      member do
        put '/publish' => 'templates#publish'
        put '/unpublish' => 'templates#unpublish'
      end
      resources :infopages, except: :index
    end
  end

  resources :categories, only: [:index, :show] do
    resources :tutorials, except: :index do
      resources :infos, except: :index
      member do
        put '/add_member' => 'tutorials#add_member'
        put '/remove_member' => 'tutorials#remove_member'
        put '/like', to: 'tutorials#like'
        put '/dislike', to: 'tutorials#dislike'
        put '/admin_remove_member', to: 'tutorials#admin_remove_member'
        put '/publish' => 'tutorials#publish'
        put '/unpublish' => 'tutorials#unpublish'
      end
    end
  end


  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: :show do
    resources :blogs
    member do
      put '/follow', to: 'users#follow'
      put '/unfollow', to: 'users#unfollow'
    end
  end
end
