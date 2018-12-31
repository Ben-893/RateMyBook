feature 'Deleting a book' do
  scenario 'A user can delete a book' do
    book = Book.create(title: 'Harry Potter', author: "J.K. Rowling", rating: 4)
    visit('/books')
    within ".navigation" do
      click_link('Sign up')
    end
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    within "#book-#{book.id}" do
      click_button 'Delete'
    end
    expect(current_path).to eq '/books'
    expect(page).not_to have_content 'Harry Potter'
  end
end