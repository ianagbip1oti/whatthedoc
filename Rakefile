require 'jars/installer'

task :install_jars do
    Jars::Installer.vendor_jars!
end

task :run do
    ruby "-J-Dorg.slf4j.simpleLogger.defaultLogLevel=debug lib/whatthedoc.rb"
end

