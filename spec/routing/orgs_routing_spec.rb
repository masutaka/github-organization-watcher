# frozen_string_literal: true

RSpec.describe OrgsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/orgs').to route_to 'orgs#index'
    end
  end
end
