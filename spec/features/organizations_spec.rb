feature 'Organizations' do
  include_context 'Capybara Features'

  given(:endpoint) { 'https://api.github.com/user/orgs' }

  context 'given a user who belongs to `emacs-jp` and `feedforce`' do
    background { webmock_get(endpoint, fixture('user_orgs_emacs-jp-and-feedforce.json')) }

    scenario 'shows the organizations' do
      visit '/organizations'
      expect(page).to have_content 'emacs-jp'
      expect(page).to have_content 'feedforce'
    end
  end

  context 'given a user who doesnot belong to any organizations' do
    background { webmock_get(endpoint, fixture('user_orgs_empty.json')) }

    scenario 'doesnot show any organizations' do
      visit '/organizations'
      expect(page).to_not have_content 'emacs-jp'
      expect(page).to_not have_content 'feedforce'
    end
  end
end
