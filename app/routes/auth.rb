module JuiceFm
  module Routes
    class Auth < Base

      get '/auth/login' do
        erb :login
      end

      post '/auth/login' do
        env['warden'].authenticate!

        flash[:success] = env['warden'].message

        if session[:return_to].nil?
          redirect '/'
        else
          redirect session[:return_to]
        end
      end

      get '/auth/logout' do
        env['warden'].raw_session.inspect
        env['warden'].logout
        flash[:success] = 'Successfully logged out'
        redirect '/'
      end

      post '/auth/unauthenticated' do
        session[:return_to] = env['warden.options'][:attempted_path]
        puts env['warden.options'][:attempted_path]
        flash[:error] = env['warden'].message || "You must log in"
        redirect '/auth/login'
      end

      # get '/protected' do
      #   env['warden'].authenticate!
      #   @current_user = env['warden'].user
      #   erb :protected
      # end

    end
  end
end
