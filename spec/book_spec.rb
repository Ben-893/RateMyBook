require 'book'


describe Book do
  describe '.all' do
    it 'returns all books in an array' do
      connection = PG.connect(dbname: 'Rate_My_Book_test')


    book_1 =  Book.create(title: "Harry Potter")
    book_2 =  Book.create(title: "Fifty SHades of Grey")
    book_3 =  Book.create(title: "The Road to Little Dribbling")


      expected_books = [
        book_1,
        book_2,
        book_3
      ]

  expect(Book.all).to eq expected_books

    end
  end

  describe '.create' do
    it 'creates a new book' do
      book_1 = Book.create(title: 'Harry Potter')
      expect(Book.all).to include book_1
    end
  end

  describe '#==' do
    it 'two Books are equal if their IDs match' do
      book_1 = Book.new(1, title: 'Harry Potter')
      book_2 = Book.new(1, title: 'Harry Potter')

      expect(book_1).to eq book_2
    end
  end

end