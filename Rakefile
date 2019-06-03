require 'jars/installer'

desc 'Install jar dependencies'
task :install_jars do
    Jars::Installer.vendor_jars!
end

desc 'Run the bot'
task :run do
    ruby '-J-Dorg.slf4j.simpleLogger.defaultLogLevel=debug lib/whatthedoc.rb'
end

begin
    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new :spec
rescue LoadError
end
