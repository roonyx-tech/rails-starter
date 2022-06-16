require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'application', type: :request do
  include_context :json

  path '/ping' do
    get 'ping application' do
      tags 'Blogs'
      consumes 'application/json'
      parameter name: :name, in: :query, type: :string

      context 'with name' do
        let(:name) { Faker::Name.first_name }

        response 200, 'successful' do
          run_test! do
            expect(json['answer']).to eq("PONG #{name}")
          end
        end
      end

      context 'without name' do
        let(:name) { '' }

        response 200, 'successful' do
          run_test! do
            expect(json['answer']).to eq('PONG My friend')
          end
        end
      end
    end
  end
end
