module JuiceFm
  module Helpers
    module WardenHelper

      def warden_handler
        env['warden']
      end

      def check_authentication
        unless warden_handler.authenticated?
          redirect '/auth/login'
        end
      end

      def check_admin
        check_authentication
        unless warden_handler.user.is_admin?
          redirect '/'
        end
      end
    end
  end
end
