require 'pg'


feature 'Viewing books' do
  scenario 'A user can see a list of books' do
  connection = PG.connect(dbname: 'Rate_My_Book_test')


    Book.create(title: "Harry Potter")
    Book.create(title: "Fifty SHades of Grey")
    Book.create(title: "The Road to Little Dribbling")


    visit('/books')

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Fifty SHades of Grey"
    expect(page).to have_content "The Road to Little Dribbling"

  end
end