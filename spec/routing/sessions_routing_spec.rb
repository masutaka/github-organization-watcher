RSpec.describe SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #callback' do
      expect(get: '/auth/github/callback')
        .to route_to 'sessions#callback', provider: 'github'
    end

    it 'routes to #destroy' do
      expect(get: '/logout').to route_to 'sessions#destroy'
    end
  end
end
