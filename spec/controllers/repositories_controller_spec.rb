RSpec.describe RepositoriesController, type: :controller do
  describe '#index' do
    before do
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos',
                           fixture('orgs_emacs-jp_0repos.json'))
    end

    it 'is `200 OK`' do
      get :index, params: { organization_name: 'emacs-jp' }
      expect(response.status).to eq 200
    end
  end
end
