require 'rails_helper'
require 'support/shared_examples_helper'

RSpec.configure do |config|
  config.include SharedExampleHelper, type: :acceptance
end
