require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth-ada/version'

module Omniauth
  module Strategies
    class Ada < OmniAuth::Strategies::OAuth2

      opiton :name, 'ada'

      option :client_options, {
        site: Rails.configuration.oauth_url,
        authorize_url: "#{Rails.configuration.oauth_url}/auth/ada/authorize",
        access_token_url: "#{Rails.configuration.oauth_url}/auth/ada/access_token"
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
