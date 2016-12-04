# frozen_string_literal: true

RSpec.describe Repo, type: :model do
  describe '.subscriptions' do
    let(:client) { Octokit::Client.new }

    before do
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                           fixture('orgs_emacs-jp_1repo.json'))
    end

    context 'given a watching repo' do
      before do
        stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_watching_1repo.json'))
      end

      it 'is watching' do
        expect(Repo.subscriptions_by_org('emacs-jp', client))
          .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :watching)]
      end
    end

    context 'given a unwatching repo' do
      before do
        stub_request_get_404('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_unwatching_1repo.json'))
      end

      it 'is unwatching' do
        expect(Repo.subscriptions_by_org('emacs-jp', client))
          .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :unwatching)]
      end
    end

    context 'given a ignoring repo' do
      before do
        stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_ignoring_1repo.json'))
      end

      it 'is ignoring' do
        expect(Repo.subscriptions_by_org('emacs-jp', client))
          .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :ignoring)]
      end
    end
  end
end
