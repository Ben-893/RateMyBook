feature 'Updating a book' do
  scenario 'A user can update a book' do
    sign_up
    visit('/books/new')
    fill_in_book("Winnie the Pooh", "A.A Milne", 3)
    visit('/books')
    click_link('Edit')
    fill_in_book("Harry Potter", "J.K. Rowling", 4)
    expect(current_path).to eq '/books'
    expect(page).not_to have_content 'Winnie the Pooh'
    expect(page).to have_content 'J.K. Rowling'
    expect(page).to have_content 4
  end
end