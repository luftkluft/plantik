require_relative '../../app/common/constants.rb'

RSpec.describe 'Plantik', type: :request do
  # include resource module
  include Docs::V1::Admin::Api

  describe 'GET ' do
    # include action module
    include Docs::V1::Admin::Index
    before { get api_v1_admin_path }

    it 'return status code 302', :dox do
      expect(response).to have_http_status('302')
    end
  end
end
