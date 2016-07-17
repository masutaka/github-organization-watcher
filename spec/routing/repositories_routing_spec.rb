RSpec.describe RepositoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/organizations/feedforce/repositories').
        to route_to 'repositories#index', organization_name: 'feedforce'
    end
  end
end
