module Jetpack
  class Application < Sinatra::Base
    use Rack::Session::Cookie

    get '/' do
      erb :application
    end
  end
end