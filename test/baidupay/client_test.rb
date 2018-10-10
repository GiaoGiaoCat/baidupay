require 'test_helper'

class Baidupay::ClientTest < Minitest::Test
  def setup
    @client = Baidupay::Client.new(
      deal_id: '470193086',
      app_key: 'MMM4hG',
      public_key: TEST_RSA_PUBLIC_KEY,
      private_key: TEST_RSA_PRIVATE_KEY,
    )
  end

  def test_client_initialize
    refute_nil @client
  end

  def test_sign
    string = 'eKn5tjMLugCvU4nv9WjwIN7+AEb3l13fKUWqYMnQpkwmo+GSWc1r8JQwI5OnGNOP4b26m4jhe5O5N20TJAqQkIqGjKsSPvVq96AZTHyfh4/z8/GdhwX9ldp7CPscQ+zlkGHEJSVYAU/W/EED3ds/ssfzBcQETP76dNbBuxSNQII='

    assert_equal string, @client.sign(tp_order_id: 'NO129388445')
  end

  # Use pair rsa key so we can test it
  def test_verify
    params = {
      out_trade_no: '20160401000000',
      trade_status: 'TRADE_SUCCESS',
      rsaSign: 'gfFC+YIGUKkh6z5toQMc+T+R0ul84dYwKrPLXu8jPy1DoSPyKSlUgty3tW/HTUJToNeVpHZXBki/I+ygT1jEhK3B0QL5QDs4Bg6gtyJrrbjvPpugoekjCftwqEDH9Gd2MEltD2Fp1U4ecdmSaXiB/DlhdkRXdicT2yfmqd/3v1Q='
    }

    assert @client.verify?(params)
  end

  def test_verify_when_wrong
    params = {
      out_trade_no: '20160401000000',
      trade_status: 'TRADE_SUCCESS',
      rsaSign: Base64.strict_encode64('WrongSign')
    }

    refute @client.verify?(params)
  end
end
