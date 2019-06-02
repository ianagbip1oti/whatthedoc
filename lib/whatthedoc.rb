require_relative 'whatthedoc_jars'
java_import com.github.princesslana.smalld.SmallD

require_relative 'js'
require_relative 'responses'

require 'json'
require 'hash_dot'

$prefix = '++'

module Echo
  def self.query(q)
    q
  end
end

$languages = {
  echo: Echo,
  js: JavaScript.new
}

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
    next if msg.author&.fetch('bot', false)
    next unless msg.content.start_with? $prefix

    content = msg.content[$prefix.length..-1]

    lang, *query = content.split

    handler = $languages[lang.to_sym]
    next unless handler

    response = handler.query(query.join ' ').to_msg

    smalld.post "/channels/#{msg.channel_id}/messages", response
  end
end
