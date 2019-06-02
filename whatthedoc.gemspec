
Gem::Specification.new do |s|
    s.name = 'whatthedoc'
    s.authors = ['Princess Lana']
    s.version = '0.0.0'
    s.summary = 'Discord bot to retrieve programming documentation'

    s.platform = 'java'

    s.requirements << 'jar com.github.princesslana, smalld, 0.2.0'
    #s.requirements << 'jar com.squareup.okhttp3, okhttp, 3.12.0'
    s.requirements << 'jar org.slf4j, slf4j-simple, 1.7.25'

    s.add_dependency 'hash_dot', '2.4.1'
    s.add_dependency 'nokogiri', '1.10.3'
    #s.add_dependency 'httparty', '0.16.4' 

    s.add_development_dependency 'jar-dependencies', '0.4.0'
    s.add_development_dependency 'rake', '12.3.2'
end
