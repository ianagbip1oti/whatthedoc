
class String
  def to_msg
    { content: self }
  end

  def first_sentence
    self.split('. ').first
  end
end

Error = Struct.new(:message) do
  def to_msg
    "Error: #{message}".to_msg
  end
end

Function = Struct.new(:name, :signature, :description, :returns, keyword_init: true) do
  def to_msg
    to_s.to_msg
  end
end

