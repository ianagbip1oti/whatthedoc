
require_relative 'responses'

require 'json'
require 'nokogiri'

class JavaScript

  def devdocs
    @@devdocs ||= JSON.parse(File.read(File.join(File.dirname(__FILE__), 'db.json')))
  end

  def query(q)
    object, method = q.split('.')

    return Error.new('Queries must be in the form Object.method') unless object && method

    docs = devdocs["global_objects/#{object.downcase}/#{method.downcase}"]

    return Error.new("Could not find #{object}.#{method}") unless docs

    to_function docs
  end

  def to_function(html_s)
    html = Nokogiri::HTML html_s

    name = html.at_xpath('//h1').content
    desc = html.at_xpath('//p').content.first_sentence
    syntax = html.at_xpath('//pre[@class="syntaxbox"]')&.content
    ret = html.at_xpath('//h3[@id="Return_value"]').next_element.content

    Function.new name: name, description: desc, signature: syntax, returns: ret
  end
end
