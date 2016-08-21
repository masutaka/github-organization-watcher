RSpec.describe TopController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to 'top#index'
    end
  end
end
