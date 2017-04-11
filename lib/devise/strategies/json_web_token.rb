require Rails.root.join('lib/auth_token')

module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        !request.headers['Authorization'].nil?
      end

      def authenticate!
        klass = mapping.to # From the Devise::Base class

        if claims and claims.fetch('class') == klass.to_s and user = klass.find_by(id: claims.fetch('id'))
          success! user
        else
          fail!
        end
      rescue KeyError => e
        Rails.logger.error "Devise::Strategies::JsonWebToken - Error: #{e}"
        fail!
      end

      def store?
        false
      end

      #########################################################################
      private

      def claims
        auth_header = request.headers['Authorization'] and
          token = auth_header.split(' ').last and
          ::AuthToken.decode(token)
      rescue
        nil
      end
    end
  end
end
