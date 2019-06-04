
class DevDocs < Module
  def initialize(file)
    @file = file
  end

  def included(base)
    file = @file

    base.class_eval do
      define_method(:devdocs) do
        @devdocs ||= JSON.parse(File.read(File.join(File.dirname(__FILE__), file)))
      end
    end
  end
end
