require_relative 'devdocs'

require 'nokogiri'

Value = Struct.new(:name, :description)

CssResponse = Struct.new(:name, :description, :signature, :values, keyword_init: true) do
  def to_msg
    to_s.to_msg
  end

  def self.parse(html_s)
    html = Nokogiri::HTML html_s

    name = html.at_xpath('//h1').content
    desc = html.at_xpath('//p').content.first_sentence
    syntax = html.at_xpath('//h2[@id="Syntax"]').next_element.content.chomp

    values = html.xpath('//dt').map do |dt|
      vname = dt.at_xpath('code').content
      vdescription = dt.next_element.content.first_sentence

      Value.new vname, vdescription
    end

    CssResponse.new name: name, description: desc, signature: syntax, values: values
  end
end

class Css
  include DevDocs.new 'css.json'

  def query(q)
    docs = devdocs[q.downcase]

    return Error.not_found(q) unless docs

    CssResponse.parse docs
  end
end
