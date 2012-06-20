require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ada < OmniAuth::Strategies::OAuth2
      puts ENV['oauth_url']

      option :name, 'ada'

      option :client_options, {
        site: "http://localhost:3001",
        authorize_url: "http://localhost:3001/auth/ada/authorize",
        access_token_url: "http://localhost:3001/auth/ada/access_token"
      }

      uid { raw_info['id'] }

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
