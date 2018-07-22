require 'book'


describe Book do
  describe '.all' do
    it 'returns all books in an array' do
      connection = PG.connect(dbname: 'Rate_My_Book_test')


      connection.exec("INSERT INTO books VALUES(1, 'Harry Potter');")
      connection.exec("INSERT INTO books VALUES(2, 'Fifty SHades of Grey');")
      connection.exec("INSERT INTO books VALUES(3, 'The Road to Little Dribbling');")


      expected_books = [
        'Harry Potter',
        'Fifty SHades of Grey',
        'The Road to Little Dribbling'
      ]

      expect(Book.all).to eq expected_books

    end
  end

  describe '.create' do
  it 'creates a new book' do
    Book.create(title: 'Harry Potter')

    expect(Book.all).to include 'Harry Potter'
  end
end
end