feature 'Deleting a book' do
  scenario 'A user can delete a book' do
    book = Book.create(title: 'Harry Potter', author: "J.K. Rowling")
    visit('/books')

    within "#book-#{book.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq '/books'
    expect(page).not_to have_content 'Harry Potter'
  end
end