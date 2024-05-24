require "hanami"

module Bookshelf
  class App < Hanami::App
    config.middleware.use :body_parser, :json
    config.shared_app_component_keys += [
                                          "persistence.config",
                                          "persistence.db",
                                          "persistence.rom",
                                        ]
  end
end
