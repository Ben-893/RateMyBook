feature 'Adding a new book' do
  scenario 'A user can add a new book to the list of Books' do
    visit('/books/new')
    fill_in('title', with: 'Harry Potter')
    fill_in('author', with: 'J.K. Rowling')
    fill_in('rating', with: 4)
    click_button('Submit')

    expect(page).to have_content 'Harry Potter'
    expect(page).to have_content 'J.K. Rowling'
    expect(page).to have_content 4
  end
end