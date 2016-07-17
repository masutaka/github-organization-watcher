RSpec.describe Repository, type: :model do
  describe '.find_by_organization_name' do
    let(:endpoint) { 'https://api.github.com/orgs/emacs-jp/repos' }

    context 'given a organization `emacs-jp` with 2 repositories' do
      before do
        stub_request_get(endpoint, fixture('orgs_emacs-jp_2repos.json'))
      end

      it 'is valid' do
        expect(Repository.find_by_organization_name('emacs-jp')).
          to match [
               have_attributes(name: 'emacs-jp.github.com'),
               have_attributes(name: 'init-loader'),
             ]
      end
    end

    context 'given a organization `emacs-jp` without repositories' do
      before do
        stub_request_get(endpoint, fixture('orgs_emacs-jp_0repos.json'))
      end

      it { expect(Repository.find_by_organization_name('emacs-jp')).to be_empty }
    end
  end
end
