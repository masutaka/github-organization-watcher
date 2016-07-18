feature 'Repositories' do
  include_context 'Capybara Features'

  context 'given a organization `emacs-jp` with 2 repositories' do
    background do
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos',
                           fixture('orgs_emacs-jp_2repos.json'))
      stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                           fixture('repos_emacs-jp_watching_1repo.json'))
      stub_request_get_404('https://api.github.com/repos/emacs-jp/init-loader/subscription',
                           fixture('repos_emacs-jp_unwatching_1repo.json'))
    end

    scenario 'shows the repositories and the conditions' do
      visit '/organizations/emacs-jp/repositories'
      expect(page).to have_content 'emacs-jp repositories'
      expect(page).to have_content 'emacs-jp.github.com, watching'
      expect(page).to have_content 'init-loader, unwatching'
    end
  end

  context 'given a organization `emacs-jp` without repositories' do
    background do
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos',
                           fixture('orgs_emacs-jp_0repos.json'))
    end

    scenario 'doesnot shows any repositories and conditions' do
      visit '/organizations/emacs-jp/repositories'
      expect(page).to have_content 'emacs-jp repositories'
      expect(page).to_not have_content 'emacs-jp.github.com, watching'
      expect(page).to_not have_content 'init-loader, unwatching'
    end
  end
end
