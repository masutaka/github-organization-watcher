# frozen_string_literal: true

RSpec.describe Repo, type: :model do
  describe '.subscriptions' do
    let(:client) { Octokit::Client.new }

    context 'given an active repo' do
      before do
        stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                             fixture('orgs_emacs-jp_1repo.json'))
      end

      context 'given notification watching' do
        before do
          stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                               fixture('repos_emacs-jp_watching_1repo.json'))
        end

        it 'is watching' do
          expect(Repo.subscriptions_by_org('emacs-jp', client))
            .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :watching, archived: false)]
        end
      end

      context 'given notification unwatching' do
        before do
          stub_request_get_404('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                               fixture('repos_emacs-jp_unwatching_1repo.json'))
        end

        it 'is unwatching' do
          expect(Repo.subscriptions_by_org('emacs-jp', client))
            .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :unwatching, archived: false)]
        end
      end

      context 'given notification ignoring' do
        before do
          stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                               fixture('repos_emacs-jp_ignoring_1repo.json'))
        end

        it 'is ignoring' do
          expect(Repo.subscriptions_by_org('emacs-jp', client))
            .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :ignoring, archived: false)]
        end
      end
    end

    context 'given an archived repo' do
      before do
        stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                             fixture('orgs_emacs-jp_1repo_archived.json'))
        stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_watching_1repo.json'))
      end

      it 'is archived' do
        expect(Repo.subscriptions_by_org('emacs-jp', client))
          .to match [have_attributes(repo: 'emacs-jp.github.com', condition: :watching, archived: true)]
      end
    end
  end
end
