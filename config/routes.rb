Rails.application.routes.draw do
  get 'uptime', to: 'uptime#index'

  # API
  # =============================================
  # constraints subdomain: 'api' do
    namespace :api, path: 'api', as: '', defaults: { format: 'json' } do
      # Authentication
      post 'login',    to: 'sessions#login'
      post 'register', to: 'sessions#register'
      post 'logout',   to: 'sessions#logout'

      # About categories and styles
      resources :categories, only: [:index, :show] do
        member do
          get :beers
        end
      end

      resources :styles, only: [:index, :show] do
        member do
          get :beers
        end
      end

      # About beers
      resources :beers, only: [:index, :show] do
        collection do
          get :featured
          get :this_week
        end
        member do
          post :rate
          post :like
          post :dislike
        end
      end

      # About users
      resources :users, only: [:index, :show] do
        member do
          get :ratings
          get :favorited
        end
        collection do
          get :me
        end
      end
    end
  # end

  match "*path", to: "routing#index", via: :all
  root to: 'uptime#index'
end
