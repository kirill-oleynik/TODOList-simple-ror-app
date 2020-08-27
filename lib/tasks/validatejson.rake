# frozen_string_literal: true

require 'jsonlint/rake_task'

desc 'validate json schemas'
task :validatejson do
  system 'jsonlint spec/support/api/schemas/*.json'
end
