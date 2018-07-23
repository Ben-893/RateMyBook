feature 'Updating a book' do
  scenario 'A user can update a book' do
   visit('/books/new')

    fill_in('title', with: "Winnie the Pooh")
    fill_in('author', with: "A.A Milne")
    click_button('Submit')

    visit('/books')

    click_link('Edit')


    fill_in('title', with: "Harry Potter")
    fill_in('author', with: "J.K. Rowling")
    click_button('Submit')


    expect(current_path).to eq '/books'
    expect(page).not_to have_content 'Winnie the Pooh'
    expect(page).to have_content 'J.K. Rowling'
  end
end