
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
end

Parameter = Struct.new(:name, :description)

Function = Struct.new(
  :name, :signature, :description, :parameters, :returns, keyword_init: true) do
  def to_msg
    to_s.to_msg
  end
end

