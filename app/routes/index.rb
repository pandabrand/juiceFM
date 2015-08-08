module JuiceFm
  module Routes
    class Index < Base
      get '/' do
        erb :login
      end

    end
  end
end
