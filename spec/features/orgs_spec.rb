feature 'Orgs' do
  include_context 'Capybara Features'

  given(:endpoint) { 'https://api.github.com/user/orgs' }

  context 'given a user who belongs to `emacs-jp`' do
    background do
      stub_request_get_200(endpoint, fixture('user_orgs_emacs-jp.json'))
    end

    scenario 'shows the orgs' do
      visit '/orgs'
      expect(page).to have_link 'emacs-jp', href: '/orgs/emacs-jp/repositories'
    end
  end

  context 'given a user who doesnot belong to any orgs' do
    background do
      stub_request_get_200(endpoint, fixture('user_orgs_empty.json'))
    end

    scenario 'doesnot show any orgs' do
      visit '/orgs'
      expect(page).to_not have_content 'emacs-jp'
    end
  end
end
