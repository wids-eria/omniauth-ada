require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ada < OmniAuth::Strategies::OAuth2

      unless ENV['ADA_URL']
        ENV['ADA_URL'] = "http://adage.gameslearningsociety.org"
      end

      option :name, 'ada'

      option :client_options, {
        site: ENV['ADA_URL'],
        authorize_url: "#{ENV['ADA_URL']}/auth/ada/authorize",
        access_token_url: "#{ENV['ADA_URL']}/auth/ada/access_token"
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
