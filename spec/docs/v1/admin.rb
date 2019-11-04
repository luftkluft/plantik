module Docs
  module V1
    module Admin
      extend Dox::DSL::Syntax
      document :api do
        resource 'Admin' do
          endpoint '/api/v1/admin'
          group 'Plantik_API'
        end
      end

      document :index do
        action 'Redirect to activeadmin'
      end
    end
  end
end
