feature 'Top' do
  include_context 'Capybara Features'

  context 'given a session' do
    given(:user) { FactoryGirl.create(:user_taro) }
    background { login_as user }

    scenario 'shows "Logout"' do
      visit '/'
      expect(page).to have_link 'Logout', href: '/logout'
    end
  end

  context 'given no session' do
    scenario 'shows "Login with GitHub"' do
      visit '/'
      expect(page).to have_link 'Login with GitHub', href: '/auth/github'
    end
  end
end
