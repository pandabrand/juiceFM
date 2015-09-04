module JuiceFm
  module Routes
    class Index < Base
      
      get '/' do
        check_authentication
        erb :index
      end

    end
  end
end
