RSpec.describe RepositoriesController, type: :controller do
  describe '#index' do
    it 'is `200 OK`' do
      get :index, params: { organization_name: 'feedforce' }
      expect(response.status).to eq 200
    end
  end
end
