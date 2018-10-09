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
end
