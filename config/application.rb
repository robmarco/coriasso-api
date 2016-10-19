require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoriassoApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Madrid'

    # Adding Lib folder
    # config.autoload_paths += %W{#{config.root}/presenters lib}

    # Locale
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.i18n.enforce_available_locales = false
    # config.i18n.default_locale = :es

    # Logs
    unless Rails.env.test?
      log_level = String(ENV['LOG_LEVEL'] || "info").upcase
      config.log_level = log_level
      config.lograge.enabled = true

      INTERNAL_PARAMS = %w(controller action format _method only_path)

      config.lograge.custom_options = lambda do |event|
        payload = event.payload
        params  = payload[:params].except(*INTERNAL_PARAMS)
        host    = payload[:host]
        ip      = payload[:ip]
        { params: params, host: host, ip: ip, time: event.time }
      end
    end

    # Generators
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.stylesheets false
      generate.request_specs false
      generate.routing_specs false
      generate.view_specs false
      generate.test_framework nil
      # generate.test_framework :rspec
      #                  :fixtures => false,
      #                  :model_specs => true,
      #                  :view_specs => false,
      #                  :helper_specs => false,
      #                  :routing_specs => false,
      #                  :controller_specs => true,
      #                  :request_specs => false
    end
    # config.action_controller.action_on_unpermitted_parameters = :raise

    # Rack::Cors configuration
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

  end
end
