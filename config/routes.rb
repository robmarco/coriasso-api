Rails.application.routes.draw do
  get 'uptime', to: 'uptime#index'

  # API
  # =============================================
  # constraints subdomain: 'api' do
    namespace :api, path: 'api', as: '', defaults: { format: 'json' } do
      # About beers and categories
      resources :beers, only: [:index, :show] do
        # member do
        #   post :rate
        #   post :unrate
        #   post :like
        #   post :dislike
        # end
      end
      resources :categories, only: [:index, :show] do
        member do
          get :beers
        end
      end
      # About users
      resources :users, only: [:index, :show]
    end
  # end

  match "*path", to: "routing#index", via: :all
  root to: 'uptime#index'
end
