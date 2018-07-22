feature 'Viewing books' do
  scenario 'A user can see a list of books' do
    visit('/books')

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Fifty SHades of Grey"
    expect(page).to have_content "The Road to Little Dribbling"

  end
end