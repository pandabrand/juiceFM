module JuiceFm
  module Routes
    class Admin < Base

      get '/admin' do
        check_admin
        erb :admin
      end

    end
  end
end
