require 'book'

describe Book do
  describe '.all' do
    it 'returns all of the books in an array' do
      array_of_books = Book.all

      expect(array_of_books).to include("Harry Potter")
      expect(array_of_books).to include("Fifty SHades of Grey")
      expect(array_of_books).to include("The Road to Little Dribbling")
    end
  end
end