require 'book'


describe Book do
  describe '.all' do
    it 'returns all books in an array' do
      connection = PG.connect(dbname: 'Rate_My_Book_test')


      book_1 =  Book.create(title: "Harry Potter", author: "J.K. Rowling", rating: 4)
      book_2 =  Book.create(title: "Fifty SHades of Grey", author: "J.K. Rowling", rating: 4)
      book_3 =  Book.create(title: "The Road to Little Dribbling", author: "J.K. Rowling", rating: 4)


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
      book_1 = Book.create(title: 'Harry Potter', author: "J.K. Rowling", rating: 4)
      expect(Book.all).to include book_1
    end
  end

  describe '#==' do
    it 'two Books are equal if their IDs match' do
      book_1 = Book.new(1, 'Harry Potter', "J.K. Rowling", 4)
      book_2 = Book.new(1, 'Harry Potter', "J.K. Rowling", 4)

      expect(book_1).to eq book_2
    end
  end

  describe '.delete' do
    it 'deletes a book' do
      book =  Book.create(title: 'Harry Potter', author: "J.K. Rowling" , rating: 4)
      Book.delete(book.id)
      books = Book.all
      titles = books.map(&:title)

      expect(titles).not_to include "Harry Potter"
    end
  end

  describe '.update' do
    it 'updates a book' do
      book = Book.create(title: "Harry Potter", author: 'J.K Rowling', rating: 4)
      Book.update(book.id, 'Something else', 'Another author', 2)

      books = Book.all
      titles = books.map(&:title)
      authors = books.map(&:author)
      rating = books.map(&:rating)

      expect(titles).not_to include "Harry Potter"
      expect(authors).not_to include "J.K Rowling"
      expect(authors).not_to include 4
      expect(titles).to include "Something else"
      expect(authors).to include "Another author"
      expect(rating).to include 2
    end
  end

end