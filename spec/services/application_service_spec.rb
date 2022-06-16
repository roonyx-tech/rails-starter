require 'rails_helper'

class ApplicationServiceClassTest < ApplicationService
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def call
    @value += 1
  end
end

class TestWithoutCall < ApplicationService; end

describe 'ApplicationService' do
  subject { ApplicationServiceClassTest.call(value) }
  let(:instance_without_call) { TestWithoutCall.call }

  describe '#call' do
    let(:value) { 1 }

    it 'init object and call method' do
      expect(subject).to eq(2)
    end

    it 'return class instance' do
      expect(instance_without_call).to be_an_instance_of(TestWithoutCall)
    end
  end
end
