require File.expand_path("../boot", __FILE__)

require "rails/all"

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Butterfly

  class Application < Rails::Application

    config.time_zone = "UTC"

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.cache_store = :dalli_store

  end

end