# frozen_string_literal: true

RSpec.describe ReposController, type: :controller do
  describe '#index' do
    context 'given a session' do
      let(:user) { create(:user_taro) }

      before do
        session[:user_id] = user.id
        stub_request_get_200('https://api.github.com/user/orgs',
                             fixture('user_orgs_empty.json'))
        stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                             fixture('orgs_emacs-jp_0repos.json'))
      end

      it 'is `200 OK`' do
        get :index, params: { org_name: 'emacs-jp' }
        expect(response.status).to eq 200
      end
    end

    context 'given no session' do
      it 'redirects to `/`' do
        get :index, params: { org_name: 'emacs-jp' }
        expect(response.status).to redirect_to '/'
      end
    end
  end
end
