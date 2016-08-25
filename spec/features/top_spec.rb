feature 'Top' do
  include_context 'Capybara Features'

  context 'given a session' do
    given(:user) { FactoryGirl.create(:user_taro) }
    given(:github_endpoint) { 'https://api.github.com/user/orgs' }

    background do
      login_as user
      stub_request_get_200(github_endpoint, fixture('user_orgs_emacs-jp.json'))
    end

    scenario 'shows "Logout"' do
      visit '/'
      expect(current_path).to eq '/orgs'
    end
  end

  context 'given no session' do
    scenario 'shows "Login with GitHub"' do
      visit '/'
      expect(page).to have_link 'Login with GitHub', href: '/auth/github'
    end
  end
end
