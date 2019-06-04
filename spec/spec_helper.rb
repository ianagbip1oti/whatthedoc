require 'rspec/its'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.disable_monkey_patching!
  config.warnings = true

  config.formatter = :documentation
  config.color = true
  config.tty = true

  config.order = :random
  Kernel.srand config.seed
end
