feature 'Repos' do
  include_context 'Capybara Features'

  given(:user) { FactoryGirl.create(:user_taro) }

  context 'given a org `emacs-jp` with 2 repos' do
    background do
      login_as user
      stub_request_get_200('https://api.github.com/user/orgs',
                           fixture('user_orgs_emacs-jp.json'))
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                           fixture('orgs_emacs-jp_2repos.json'))
      stub_request_get_200('https://api.github.com/repos/emacs-jp/emacs-jp.github.com/subscription',
                           fixture('repos_emacs-jp_watching_1repo.json'))
      stub_request_get_404('https://api.github.com/repos/emacs-jp/init-loader/subscription',
                           fixture('repos_emacs-jp_unwatching_1repo.json'))
    end

    scenario 'shows the repos and the conditions' do
      visit '/orgs/emacs-jp/repos'
      expect(page).to have_css 'a.active', text: 'emacs-jp'
      expect(find(:css, '#emacs-jp-github-com .watching')).to be_checked
      expect(find(:css, '#init-loader .unwatching')).to be_checked
    end
  end

  context 'given a org `emacs-jp` without repos' do
    background do
      login_as user
      stub_request_get_200('https://api.github.com/user/orgs',
                           fixture('user_orgs_emacs-jp.json'))
      stub_request_get_200('https://api.github.com/orgs/emacs-jp/repos?per_page=100',
                           fixture('orgs_emacs-jp_0repos.json'))
    end

    scenario 'doesnot shows any repos and conditions' do
      visit '/orgs/emacs-jp/repos'
      expect(page).to have_css 'a.active', text: 'emacs-jp'
      expect(page).to_not have_content 'emacs-jp.github.com'
      expect(page).to_not have_content 'init-loader'
    end
  end
end
