require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ProjetoPousadaOnrails
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_paths << Rails.root.join("lib")
    
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_projeto_pousada_session'

    # Configuração do fuso horário (opcional)
    # config.time_zone = "Central Time (US & Canada)"

    # Configuração de caminhos para carregamento precoce (opcional)
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators.system_tests = nil
  end
end
