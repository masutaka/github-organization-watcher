# frozen_string_literal: true

RSpec.describe SubscriptionsController, type: :controller do
  let(:github_endpoint) { 'https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription' }
  let(:user) { FactoryGirl.create(:user_taro) }

  describe '#update' do
    context 'given a session' do
      before do
        session[:user_id] = user.id
        stub_request_put_200(github_endpoint, fixture('subscription_watch.json'))
      end

      it 'is `201 Created`' do
        get :update, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
        expect(response.status).to eq 201
      end
    end

    context 'given no session' do
      it 'is `401 Unauthorized`' do
        get :update, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
        expect(response.status).to eq 401
      end
    end
  end

  describe '#destroy' do
    context 'given a session' do
      before do
        session[:user_id] = user.id
        stub_request_delete_200(github_endpoint, fixture('subscription_unwatch.json'))
      end

      it 'is `200 OK`' do
        delete :destroy, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
        expect(response.status).to eq 200
      end
    end

    context 'given no session' do
      it 'is `401 Unauthorized`' do
        delete :destroy, params: { owner: 'emacs-jp', repo: 'emacs-jp.github.com' }
        expect(response.status).to eq 401
      end
    end
  end
end
