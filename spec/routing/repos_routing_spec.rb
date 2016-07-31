RSpec.describe ReposController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/orgs/emacs-jp/repos').
        to route_to 'repos#index', org_name: 'emacs-jp'
    end
  end
end
