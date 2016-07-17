feature 'Repositories' do
  include_context 'Capybara Features'

  context 'given organization `feedforce`' do
    scenario 'shows the repositories' do
      visit '/organizations/feedforce/repositories'
      expect(page).to have_content 'feedforce repositories'
    end
  end
end
