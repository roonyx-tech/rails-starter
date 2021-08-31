module SharedExampleHelper
  extend ActiveSupport::Concern

  shared_context :json do
    header 'Accept', 'application/json'
    let(:json) { JSON.parse(response_body) }
  end
end
