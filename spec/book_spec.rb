require 'book'


describe Book do
  describe '.all' do
    it 'returns all books in an array' do
      connection = PG.connect(dbname: 'Rate_My_Book_test')


    book_1 =  Book.create(title: "Harry Potter", author: "J.K. Rowling")
    book_2 =  Book.create(title: "Fifty SHades of Grey", author: "J.K. Rowling")
    book_3 =  Book.create(title: "The Road to Little Dribbling", author: "J.K. Rowling")


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
      book_1 = Book.create(title: 'Harry Potter', author: "J.K. Rowling")
      expect(Book.all).to include book_1
    end
  end

  describe '#==' do
    it 'two Books are equal if their IDs match' do
      book_1 = Book.new(1, 'Harry Potter', "J.K. Rowling")
      book_2 = Book.new(1, 'Harry Potter', "J.K. Rowling")

      expect(book_1).to eq book_2
    end
  end

describe '.delete' do
    it 'deletes a book' do
      book =  Book.create(title: 'Harry Potter', author: "J.K. Rowling")
      Book.delete(book.id)
      books = Book.all
      titles = books.map(&:title)

    expect(titles).not_to include "Harry Potter"
  end
end

describe '.update' do
    it 'updates a book' do
      book = Book.create(title: "Harry Potter", author: 'J.K Rowling')
      Book.update(book.id, 'Something else', 'Another author')

      books = Book.all
      titles = books.map(&:title)
      authors = books.map(&:author)

      expect(titles).not_to include "Harry Potter"
      expect(authors).not_to include "J.K Rowling"
      expect(titles).to include "Something else"
      expect(authors).to include "Another author"
    end
  end

end