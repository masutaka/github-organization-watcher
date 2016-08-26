# frozen_string_literal: true

RSpec.describe SubscriptionsController, type: :routing do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: '/repos/emacs-jp/emacs-jp.github.com_1A/subscription')
        .to route_to 'subscriptions#update', owner: 'emacs-jp', repo: 'emacs-jp.github.com_1A'
    end

    it 'routes to #destroy' do
      expect(delete: '/repos/emacs-jp/emacs-jp.github.com_1A/subscription')
        .to route_to 'subscriptions#destroy', owner: 'emacs-jp', repo: 'emacs-jp.github.com_1A'
    end
  end
end
