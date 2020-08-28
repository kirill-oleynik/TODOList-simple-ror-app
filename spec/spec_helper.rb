# frozen_string_literal: true

require 'json_matchers/rspec'
JsonMatchers.schema_root = 'spec/support/api/schemas'
Dir[File.join('./support/**.*.rb')].sort.each { |f| require f }
RSpec.configure do |config|
  config.add_formatter 'Fuubar'
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.expose_dsl_globally = true

  config.order = :random
  config.profile_examples = 10
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = 'tmp/rspec_data.txt'

  Kernel.srand config.seed
end
