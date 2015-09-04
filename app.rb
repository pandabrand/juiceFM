require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

require 'dotenv'
Dotenv.load

# Require base
require 'sinatra/base'
require 'mongo'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/json'
require 'warden'

Dir['lib/**/*.rb'].sort.each { |file| require file }

require 'app/extensions'
require 'app/models'
require 'app/helpers'
require 'app/routes'

module JuiceFm
  class App < Sinatra::Application

    register Sinatra::Flash

    configure :development, :staging do
      enable :sessions, :logging, :dump_errors
      logger = Logger.new($stdout)
    end

    configure do
      disable :method_override
      disable :static

      set :erb, escape_html: true

      set :sessions,
          httponly: true,
          secure: production?,
          expire_after: 5.years,
          secret: ENV['SESSION_SECRET']

    end

    use Rack::Deflater
    use Rack::Standards

    use Routes::Static

    unless settings.production?
      use Routes::Assets
    end

    # Other routes:
    # use Routes::Posts
    use Routes::Index
    use Routes::About
    use Routes::Auth
    use Routes::Admin

  end
end

include JuiceFm::Models
include Warden::Test::Helpers
