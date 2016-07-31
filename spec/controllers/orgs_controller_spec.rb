RSpec.describe OrgsController, type: :controller do
  describe '#index' do
    before do
      stub_request_get_200('https://api.github.com/user/orgs',
                           fixture('user_orgs_empty.json'))
    end

    it 'is `200 OK`' do
      get :index
      expect(response.status).to eq 200
    end
  end
end
