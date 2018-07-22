require 'pg'


feature 'Viewing books' do
  scenario 'A user can see a list of books' do
  connection = PG.connect(dbname: 'Rate_My_Book_test')


    connection.exec("INSERT INTO books VALUES(1, 'Harry Potter');")
    connection.exec("INSERT INTO books VALUES(2, 'Fifty SHades of Grey');")
    connection.exec("INSERT INTO books VALUES(3, 'The Road to Little Dribbling');")


    visit('/books')

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Fifty SHades of Grey"
    expect(page).to have_content "The Road to Little Dribbling"

  end
end