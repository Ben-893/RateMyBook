require 'book'


describe Book do
  describe '.all' do
    it 'returns all books in an array' do
      connection = PG.connect(dbname: 'Rate_My_Book_test')


      Book.create(title: "Harry Potter")
      Book.create(title: "Fifty SHades of Grey")
      Book.create(title: "The Road to Little Dribbling")


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