RSpec.describe Organization, type: :model do
  describe '.all' do
    let(:endpoint) { 'https://api.github.com/user/orgs' }

    context 'given a user who belongs to `emacs-jp` and `doramichan`' do
      before do
        stub_request_get_200(endpoint, fixture('user_orgs_emacs-jp_and_doramichan.json'))
      end

      it 'is valid' do
        expect(Organization.all).
          to match [
               have_attributes(login: 'emacs-jp'),
               have_attributes(login: 'doramichan'),
             ]
      end
    end

    context 'given a user who doesnot belong to any organizations' do
      before do
        stub_request_get_200(endpoint, fixture('user_orgs_empty.json'))
      end

      it 'is empty' do
        expect(Organization.all).to be_empty
      end
    end
  end

  describe '.repositories' do
    let(:endpoint) { 'https://api.github.com/orgs/emacs-jp/repos' }

    context 'given a organization `emacs-jp` with 2 repositories' do
      before do
        stub_request_get_200(endpoint, fixture('orgs_emacs-jp_2repos.json'))
      end

      it 'is valid' do
        expect(Organization.repositories('emacs-jp')).
          to match [
               have_attributes(name: 'emacs-jp.github.com'),
               have_attributes(name: 'init-loader'),
             ]
      end
    end

    context 'given a organization `emacs-jp` without repositories' do
      before do
        stub_request_get_200(endpoint, fixture('orgs_emacs-jp_0repos.json'))
      end

      it 'is empty' do
        expect(Organization.repositories('emacs-jp')).to be_empty
      end
    end
  end

  describe '.repositories_subscription' do
    before do
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos',
                           fixture('orgs_emacs-jp_1repo.json'))
    end

    context 'given a watching repository' do
      before do
        stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_watching_1repo.json'))
      end

      it 'is valid' do
        result = Organization.repositories_subscription('emacs-jp')
        expect(result['emacs-jp.github.com'][:subscribed]).to be_truthy
        expect(result['emacs-jp.github.com'][:ignored]).to be_falsey
      end
    end

    context 'given a unwatching repository' do
      before do
        stub_request_get_404('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_unwatching_1repo.json'))
      end

      it 'is valid' do
        result = Organization.repositories_subscription('emacs-jp')
        expect(result['emacs-jp.github.com']).to be_nil
      end
    end

    context 'given a ignoring repository' do
      before do
        stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                             fixture('repos_emacs-jp_ignoring_1repo.json'))
      end

      it 'is valid' do
        result = Organization.repositories_subscription('emacs-jp')
        expect(result['emacs-jp.github.com'][:subscribed]).to be_falsey
        expect(result['emacs-jp.github.com'][:ignored]).to be_truthy
      end
    end
  end
end
