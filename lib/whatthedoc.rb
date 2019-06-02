require_relative 'whatthedoc_jars'
java_import com.github.princesslana.smalld.SmallD

require_relative 'js'

require 'json'
require 'hash_dot'


class SmallD
  alias_method :post_string, :post

  def post(path, payload)
    post_string path, payload.to_json
  end

  def on_message_create(&block)
    return unless block

    self.onGatewayPayload do |str_p|
      json_p = JSON.parse(str_p).to_dot
      block.call(json_p.d) if json_p.t == 'MESSAGE_CREATE'
    end
  end
end

SmallD.run(ENV['SMALLD_TOKEN']) do |smalld|
  smalld.on_message_create do |msg|
    smalld.post "/channels/#{msg.channel_id}/messages", content: 'pong' if msg.content == '++ping'
  end
end
