require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module RouteManager
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.api_only = false
  end
end