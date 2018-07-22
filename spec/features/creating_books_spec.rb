feature 'Adding a new book' do
  scenario 'A user can add a new book to the list of Books' do
    visit('/books/new')
    fill_in('title', with: 'Harry Potter')
    click_button('Submit')

    expect(page).to have_content 'Harry Potter'
  end
end