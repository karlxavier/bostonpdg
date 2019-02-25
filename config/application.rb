require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RegencyApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local

    config.exceptions_app = self.routes

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
      end
    end
    config.active_record.belongs_to_required_by_default = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host:'afternoon-cove-37922.herokuapp.com'}
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.smtp_settings = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :domain               => "gmail.com",
        :user_name            => "notifications@burningmidnight.com",
        :password             => "Qazwsx123",
        :authentication       => :plain,
        :enable_starttls_auto => true
    }
  end
end
