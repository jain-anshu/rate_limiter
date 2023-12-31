require_relative "boot"

require "rails/all"

require_relative "../lib/rate_limiter_klass.rb"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module RateLimiter
  class Application < Rails::Application
    
    # Initialize configuration defaults for originally generated Rails version.
   
    config.middleware.use RateLimiterKlass, limit: 1, period: 1.minute
    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
