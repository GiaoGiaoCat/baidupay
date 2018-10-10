module Baidupay
  class Client
    attr_accessor :deal_id, :app_key, :public_key, :private_key

    def initialize(options)
      options = ::Baidupay::Utils.stringify_keys(options)
      @deal_id = options['deal_id']
      @app_key = options['app_key']
      @public_key = options['public_key']
      @private_key = options['private_key']
    end

    def sign(params)
      string = params_to_string(prepare_params(params))
      ::Baidupay::Sign::RSA.sign(private_key, string)
    end

    def verify?(params)
      params = Utils.stringify_keys(params)
      sign = params.delete('rsaSign')
      string = params_to_string(params)
      ::Baidupay::Sign::RSA.verify?(public_key, string, sign)
    end

    private

    def prepare_params(params)
      params = ::Baidupay::Utils.stringify_keys(params)
      prepare_params = {
        'appKey' => app_key, 'dealId' => deal_id, 'tpOrderId' => params['tp_order_id']
      }
      prepare_params
    end

    def params_to_string(params)
      params.sort.map { |item| item.join('=') }.join('&')
    end
  end
end
