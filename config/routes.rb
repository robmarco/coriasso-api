Rails.application.routes.draw do
  get 'uptime', to: 'uptime#index'
  root to: 'uptime#index'
end
