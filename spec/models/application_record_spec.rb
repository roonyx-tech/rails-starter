require 'rails_helper'

class TestClass < ApplicationRecord; end

RSpec.describe ApplicationRecord do
  it { expect(TestClass).to be < ApplicationRecord }
end
