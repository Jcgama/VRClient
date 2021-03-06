RSpec.configure do |config|
   config.color     = true
   config.tty       = true
   config.formatter = :documentation # :progress, :html, :textmate

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
