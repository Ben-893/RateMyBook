feature 'Updating a book' do
  scenario 'A user can update a book' do
    visit('/')
    click_link('Sign up')

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    visit('/books/new')

    fill_in('title', with: "Winnie the Pooh")
    fill_in('author', with: "A.A Milne")
    fill_in('rating', with: 3)
    click_button('Submit')

    visit('/books')

    click_link('Edit')


    fill_in('title', with: "Harry Potter")
    fill_in('author', with: "J.K. Rowling")
    fill_in('rating', with: 4)
    click_button('Submit')


    expect(current_path).to eq '/books'
    expect(page).not_to have_content 'Winnie the Pooh'
    expect(page).to have_content 'J.K. Rowling'
    expect(page).to have_content 4

  end
end