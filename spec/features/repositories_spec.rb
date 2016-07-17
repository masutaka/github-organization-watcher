feature 'Repositories' do
  include_context 'Capybara Features'

  given(:endpoint) { 'https://api.github.com/orgs/emacs-jp/repos' }

  context 'given a organization `emacs-jp` with 2 repositories' do
    background do
      stub_request_get(endpoint, fixture('orgs_emacs-jp_2repos.json'))
    end

    scenario 'shows the repositories' do
      visit '/organizations/emacs-jp/repositories'
      expect(page).to have_content 'emacs-jp repositories'
      expect(page).to have_content 'emacs-jp.github.com'
      expect(page).to have_content 'init-loader'
    end
  end

  context 'given a organization `emacs-jp` without repositories' do
    background do
      stub_request_get(endpoint, fixture('orgs_emacs-jp_0repos.json'))
    end

    scenario 'doesnot shows any repositories' do
      visit '/organizations/emacs-jp/repositories'
      expect(page).to have_content 'emacs-jp repositories'
      expect(page).to_not have_content 'emacs-jp.github.com'
      expect(page).to_not have_content 'init-loader'
    end
  end
end
