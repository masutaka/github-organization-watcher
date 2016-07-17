RSpec.describe RepositoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/organizations/emacs-jp/repositories').
        to route_to 'repositories#index', organization_name: 'emacs-jp'
    end
  end
end
