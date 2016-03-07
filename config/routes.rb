Rails.application.routes.draw do
  root 'static#index'
  resource :subscriptions
  resource :card
  namespace :admin do
    root 'dashboard#index'
    resources :categories, except: [:show]
    resources :dashboards, only: [:index]
    resources :users
  end
  mount StripeEvent::Engine, at: '/stripe/webhook'
  get '/search' => 'static#search', as: 'search'

  get '/connect/oauth' => 'connect#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'connect#confirm', as: 'stripe_confirm'
  resources :categories, only: [:index, :show] do
    resources :snippets do
      member do
        put '/like' => 'snippets#like'
        put '/dislike' => 'snippets#dislike'
        put '/publish' => 'snippets#publish'
        put '/unpublish' => 'snippets#unpublish'
        put '/bookmark' => 'snippets#bookmark'
        put '/remove_bookmark' => 'snippets#remove_bookmark'
        put '/feature' => 'snippets#feature'
      end
    end
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
        get '/add_template' => 'tutorials#add_template'
        put '/add_this_template' => 'tutorials#add_this_template'
        put '/remove_template' => 'tutorials#remove_template'
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
