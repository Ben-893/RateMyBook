require 'pg'
feature 'Viewing books' do
  scenario 'A user can see a list of books' do
    connection = PG.connect(dbname: 'Rate_My_Book_test')
    Book.create(title: "Harry Potter", author: "J.K. Rowling", rating: 4)
    Book.create(title: "Fifty SHades of Grey", author: "J.K. Rowling", rating: 4)
    Book.create(title: "The Road to Little Dribbling", author: "J.K. Rowling", rating: 4)
    visit('/books')
    within ".navigation" do
      click_link('Sign up')
    end
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Fifty SHades of Grey"
    expect(page).to have_content "The Road to Little Dribbling"
    expect(page).to have_content "J.K. Rowling"
    expect(page).to have_content 4
  end
end