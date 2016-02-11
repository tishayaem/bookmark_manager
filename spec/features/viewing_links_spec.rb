
feature 'Filtering links by tags' do
scenario 'I can filter links by tag' do
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  visit '/tags/search'
   within 'ul#links' do
    expect(page).to have_content('search')

  end
end
end
