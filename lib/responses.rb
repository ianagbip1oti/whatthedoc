
class String
  def to_msg
    { content: self }
  end

  def first_sentence
    self.split('. ').first
  end
end

class Error
  attr_reader :message

  def initialize(msg)
    @message = msg
  end

  def to_msg
    "Error: #{message}".to_msg
  end
end


class Function
  Parameter = Struct.new(:name, :description)

  attr_reader :name, :signature, :description, :parameters, :returns

  def initialize(name:, signature: '', description: '', returns: '')
    @name = name
    @signature = signature
    @description = description
    @parameters = []
    @returns = returns
  end

  def to_msg
    "Name: #{name}\nSignature: #{signature}\nDescription: #{description}\nReturns: #{returns}".to_msg
  end
end

