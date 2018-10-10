# Baidupay

百度商户平台支付 ruby gem。使用之前请先阅读 https://dianshang.baidu.com/platform/doclist/index.html#!/home

**注：所有代码均魔改自 Rei 的 [alipay](https://github.com/chloerei/alipay)，因百度电商平台功能比较少，所以代码砍了很多。**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baidupay'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install baidupay
```

## Usage

在开始使用之前，需要准备 4 项配置：

1. DEAL_ID：跳转百度收银台支付必带参数之一，是百度收银台的财务结算凭证，与账号绑定的结算协议一一对应，每笔交易将结算到dealId对应的协议主体。
2. APP_KEY：用以表示应用身份的唯一id，在应用审核通过后进行分配，一经分配后不会发生更改，来唯一确定一个应用。
3. PUBLIC_KEY: 平台请求TP应用时，TP用于验签使用的公钥，在应用审核通过后分配，一经分配不会发生更改，每个应用对应不同的平台公钥。
4. PRIVATE_KEY: 进行 RSA 签名计算时候需要用，该密钥由本地生成，需要将对应的公钥上传自百度商户平台，平台用于验签使用，需要在申请应用时填写。

建立一个客户端以便快速调用API：

```ruby
@client = Alipay::Client.new(
  deal_id: DEAL_ID,
  app_key: APP_KEY,
  public_key: PUBLIC_KEY,
  private_key: PRIVATE_KEY
)
```

计算签名：

```ruby
@client.sign(tp_order_id: 'NO129388445') #=> 'eKn5tjMLugCvU4nv9WjwIN7+AEb3l13fKUWqYMnQpkwmo+...'
```

验证异步通知：

```ruby
if @client.verify?(request.request_parameters)
  render plain: 'success'
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
