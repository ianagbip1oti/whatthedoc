
require_relative 'devdocs'
require_relative 'responses'

require 'json'
require 'nokogiri'

class JavaScript
  include DevDocs.new 'js.json'

  def query(q)
    object, method = q.split('.')

    return Error.new('Queries must be in the form Object.method') unless object && method

    docs = devdocs["global_objects/#{object.downcase}/#{method.downcase}"]

    return Error.not_found(q) unless docs

    to_function docs
  end

  def to_function(html_s)
    html = Nokogiri::HTML html_s

    name = html.at_xpath('//h1').content
    desc = html.at_xpath('//p').content.first_sentence
    syntax = html.at_xpath('//h2[@id="Syntax"]').next_element.content
    ret = html.at_xpath('//h3[@id="Return_value"]').next_element.content

    parameters = html.xpath('//dt').map do |dt|
      pname = dt.at_xpath('code').content
      pdescription = dt.next_element.content.first_sentence

      Parameter.new pname, pdescription
    end

    Function.new(
      name: name, description: desc, signature: syntax, parameters: parameters, returns: ret)
  end
end
