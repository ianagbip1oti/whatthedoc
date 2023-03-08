
Gem::Specification.new do |s|
    s.name = 'whatthedoc'
    s.authors = ['Princess Lana']
    s.version = '0.0.0'
    s.summary = 'Discord bot to retrieve programming documentation'

    s.platform = 'java'

    s.requirements << 'jar com.github.princesslana, smalld, 0.2.0'
    s.requirements << 'jar org.slf4j, slf4j-simple, 1.7.25'

    s.add_dependency 'hash_dot', '2.4.1'
    s.add_dependency 'nokogiri', '1.14.2'

    s.add_development_dependency 'jar-dependencies', '0.4.0'
    s.add_development_dependency 'rake', '12.3.2'
    s.add_development_dependency 'rspec', '3.8.0'
    s.add_development_dependency 'rspec-its', '1.3.0'
end
