feature 'Organizing links' do
  scenario 'tagging links' do
    visit '/links/new'
    fill_in 'title', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.com'
    fill_in 'tags', with: 'search'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end
end

feature 'Adding multiple links' do
  scenario 'tagging links with multiple tags' do
    visit '/links/new'
    fill_in 'title', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.com'
    fill_in 'tags', with: 'search search_engine web'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'search_engine', 'web')
  end
end
