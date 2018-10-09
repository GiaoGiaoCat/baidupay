require 'net/http'
require 'cgi'
require 'baidupay/version'
require 'baidupay/utils'
require 'baidupay/sign/rsa'
# require 'baidupay/service'
# require 'baidupay/notify'
# require 'baidupay/wap/service'
# require 'baidupay/wap/notify'
# require 'baidupay/wap/sign'
# require 'baidupay/mobile/service'
# require 'baidupay/mobile/sign'
require 'baidupay/client'

module Baidupay
  @debug_mode = true
  @sign_type = 'MD5'

  class << self
    attr_accessor :pid, :key, :sign_type, :debug_mode

    def debug_mode?
      !!@debug_mode
    end
  end
end
