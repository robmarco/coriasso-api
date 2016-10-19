Rails.application.routes.draw do
  get "uptime#index"

  root to: "uptime#index"
end
