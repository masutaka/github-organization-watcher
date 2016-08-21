RSpec.describe ReposController, type: :controller do
  describe '#index' do
    let(:user) { FactoryGirl.create(:user_taro) }

    before do
      session[:user_id] = user.id
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                           fixture('orgs_emacs-jp_0repos.json'))
    end

    it 'is `200 OK`' do
      get :index, params: { org_name: 'emacs-jp' }
      expect(response.status).to eq 200
    end
  end
end
