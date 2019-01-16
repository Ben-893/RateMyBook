feature 'Adding a new book' do
  scenario 'A user can add a new book to the list of Books' do
    sign_up
    click_link('Add')
    fill_in_book('Harry Potter', 'J.K. Rowling', '4')
    expect(page).to have_content 'Harry Potter'
    expect(page).to have_content 'J.K. Rowling'
    expect(page).to have_content 4
  end
end