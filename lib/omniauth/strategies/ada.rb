require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ada
      include OmniAuth::Strategy

      option :name, 'ada'

      option :client_options, {
        site: ENV['oauth_url'],
        authorize_url: "#{ENV['oauth_url']}/auth/ada/authorize",
        access_token_url: "#{ENV['oauth_url']}/auth/ada/access_token"
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