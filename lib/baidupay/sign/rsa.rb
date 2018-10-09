require 'openssl'
require 'base64'

module Baidupay
  module Sign
    class RSA
      def self.sign(key, string)
        rsa = OpenSSL::PKey::RSA.new(key)
        Base64.strict_encode64(rsa.sign('sha1', string))
      end

      def self.verify?(key, string, sign)
        rsa = OpenSSL::PKey::RSA.new(key)
        rsa.verify('sha1', Base64.strict_decode64(sign), string)
      end
    end
  end
end
