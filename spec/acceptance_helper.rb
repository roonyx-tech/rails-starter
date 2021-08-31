require 'rails_helper'
require 'support/shared_examples_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = %i[json combined_text html open_api]
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'API'
end

RSpec.configure do |config|
  config.include SharedExampleHelper, type: :acceptance
  config.include ActiveJob::TestHelper, type: :acceptance
  config.include ActiveSupport::Testing::TimeHelpers
end
