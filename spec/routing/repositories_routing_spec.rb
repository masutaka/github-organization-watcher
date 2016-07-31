RSpec.describe RepositoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/orgs/emacs-jp/repositories').
        to route_to 'repositories#index', org_name: 'emacs-jp'
    end
  end
end
