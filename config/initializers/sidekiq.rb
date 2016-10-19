require 'sidekiq'

Sidekiq.configure_client do |config|
  if ENV["REDIS_PASSWORD"].present?
    config.redis = { :size => 1, :password => ENV["REDIS_PASSWORD"] }
  else
    config.redis = { :size => 1 }
  end
end

Sidekiq.configure_server do |config|
  # The config.redis is calculated by the
  # concurrency value so you do not need to
  # specify this.
  Rails.logger = Sidekiq::Logging.logger
  if ENV["REDIS_PASSWORD"].present?
    config.redis = { :size => 9, :password => ENV["REDIS_PASSWORD"] }
  else
    config.redis = { :size => 9 }
  end
end
