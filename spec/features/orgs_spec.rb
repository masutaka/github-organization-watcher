feature 'Orgs' do
  include_context 'Capybara Features'

  given(:github_endpoint) { 'https://api.github.com/user/orgs' }
  given(:user) { FactoryGirl.create(:user) }

  context 'given a user who belongs to `emacs-jp`' do
    background do
      login_as user
      stub_request_get_200(github_endpoint, fixture('user_orgs_emacs-jp.json'))
    end

    scenario 'shows the orgs' do
      visit '/orgs'
      expect(page).to have_link 'emacs-jp', href: '/orgs/emacs-jp/repos'
    end
  end

  context 'given a user who doesnot belong to any orgs' do
    background do
      login_as user
      stub_request_get_200(github_endpoint, fixture('user_orgs_empty.json'))
    end

    scenario 'doesnot show any orgs' do
      visit '/orgs'
      expect(page).to_not have_content 'emacs-jp'
    end
  end
end
