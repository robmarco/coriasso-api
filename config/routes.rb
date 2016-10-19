Rails.application.routes.draw do
  get 'uptime', to: 'uptime#index'

  # API
  # =============================================
  # constraints subdomain: 'api' do
    namespace :api, path: 'api', as: '', defaults: { format: 'json' } do
      
    end
  # end

  match "*path", to: "routing#index", via: :all
  root to: 'uptime#index'
end
