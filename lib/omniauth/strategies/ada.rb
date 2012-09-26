require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ada < OmniAuth::Strategies::OAuth2
      puts ENV['oauth_url']

      option :name, 'ada'

      option :client_options, {
        site: "http://ada.production.eriainteractive.com",
        authorize_url: "http://ada.production.eriainteractive.com/auth/ada/authorize",
        access_token_url: "http://ada.production.eriainteractive.com/auth/ada/access_token"
      }

      uid { raw_info['uid'] }

      info do
        {
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/ada/user.json?oauth_token=#{access_token.token}").parsed
      end

    end
  end
end
