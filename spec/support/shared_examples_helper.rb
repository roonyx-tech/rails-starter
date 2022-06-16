module SharedExampleHelper
  extend ActiveSupport::Concern

  shared_context :json do
    let(:json) { JSON.parse(response.body) }
  end
end
