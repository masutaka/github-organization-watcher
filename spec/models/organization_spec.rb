RSpec.describe Organization, type: :model do
  describe '.all' do
    let(:endpoint) { 'https://api.github.com/user/orgs' }

    context 'given a user who belongs to `emacs-jp` and `feedforce`' do
      before do
        stub_request_get(endpoint, fixture('user_orgs_emacs-jp-and-feedforce.json'))
      end

      it 'is valid' do
        expect(Organization.all).
          to match [
               have_attributes(login: 'emacs-jp'),
               have_attributes(login: 'feedforce'),
             ]
      end
    end

    context 'given a user who doesnot belong to any organizations' do
      before do
        stub_request_get(endpoint, fixture('user_orgs_empty.json'))
      end

      it { expect(Organization.all).to be_empty }
    end
  end
end
