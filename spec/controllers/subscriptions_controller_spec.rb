RSpec.describe SubscriptionsController, type: :controller do
  describe '#update' do
    it 'is `201 Created`' do
      get :update, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
      expect(response.status).to eq 201
    end
  end

  describe '#destroy' do
    it 'is `200 OK`' do
      delete :destroy, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
      expect(response.status).to eq 200
    end
  end
end
