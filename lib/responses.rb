
class String
  def to_msg
    { content: self }
  end

  def first_sentence
    self.split(/[\.:] /).first.strip
  end
end

Error = Struct.new(:message) do
  def to_msg
    "Error: #{message}".to_msg
  end

  def self.not_found(q)
    Error.new "Could not find #{q}"
  end
end

Parameter = Struct.new(:name, :description)

Function = Struct.new(
  :name, :signature, :description, :parameters, :returns, keyword_init: true) do

  def to_msg
    { embed: 
      {
        title: "```#{name}```",
        description: "#{description}\n\n```#{signature}```",
        fields: [
          { name: "Parameters",
            value: parameters.map { |p| "**#{p.name}** - #{p.description}" }.join("\n")
          },
          { name: "Returns", value: returns }
        ]
      }
    }
  end
end

