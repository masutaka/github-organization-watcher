RSpec.describe OrgsController, type: :controller do
  describe '#index' do
    context 'given a session' do
      let(:user) { FactoryGirl.create(:user_taro) }

      before do
        session[:user_id] = user.id
        stub_request_get_200('https://api.github.com/user/orgs',
                             fixture('user_orgs_empty.json'))
      end

      it 'is `200 OK`' do
        get :index
        expect(response.status).to eq 200
      end
    end

    context 'given no session' do
      it 'redirects to `/`' do
        get :index
        expect(response.status).to redirect_to '/'
      end
    end
  end
end
