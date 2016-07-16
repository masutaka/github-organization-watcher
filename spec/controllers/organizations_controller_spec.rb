RSpec.describe OrganizationsController, type: :controller do
  describe '#index' do
    it 'is `200 OK`' do
      get :index
      expect(response.status).to eq 200
    end
  end
end
