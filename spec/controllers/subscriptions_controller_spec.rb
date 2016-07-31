RSpec.describe SubscriptionsController, type: :controller do
  let(:github_endpoint) { 'https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription' }

  describe '#update' do
    before do
      stub_request_put_200(github_endpoint, fixture('subscription_watch.json'))
    end

    it 'is `201 Created`' do
      get :update, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
      expect(response.status).to eq 201
    end
  end

  describe '#destroy' do
    before do
      stub_request_delete_200(github_endpoint, fixture('subscription_unwatch.json'))
    end

    it 'is `200 OK`' do
      delete :destroy, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
      expect(response.status).to eq 200
    end
  end
end
