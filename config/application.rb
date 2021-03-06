require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TeamSalmon
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      # Don't create helpers files when using
      # the generator
      g.helper = false
      # Don't create assets files when using the
      # generator
      g.assets = false
    
      # This tells Rails ActiveJob to use the gem
      # "delayed_job" to manage our job queue.
    end
    # ADD THIS
    # ---------------------------------------
    config.active_job.queue_adapter = :delayed_job
    # ---------------------------------------
  end
end
