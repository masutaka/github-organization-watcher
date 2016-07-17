RSpec.describe OrganizationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/organizations').to route_to 'organizations#index'
    end
  end
end
