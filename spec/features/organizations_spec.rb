feature 'Organizations' do
  include_context 'Capybara Features'

  given(:endpoint) { 'https://api.github.com/user/orgs' }

  context 'given a user who belongs to `emacs-jp`' do
    background do
      stub_request_get(endpoint, fixture('user_orgs_emacs-jp.json'))
    end

    scenario 'shows the organizations' do
      visit '/organizations'
      expect(page).to have_link 'emacs-jp', href: '/organizations/emacs-jp/repositories'
    end
  end

  context 'given a user who doesnot belong to any organizations' do
    background do
      stub_request_get(endpoint, fixture('user_orgs_empty.json'))
    end

    scenario 'doesnot show any organizations' do
      visit '/organizations'
      expect(page).to_not have_content 'emacs-jp'
    end
  end
end
