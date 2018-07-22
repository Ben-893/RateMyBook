require 'pg'

class Book
  attr_reader :id, :title

  def initialize(id, title)
    @id  = id
    @title = title
  end



  def self.all
    Book.switch_database
    result = @connection.exec("SELECT * FROM books")
    result.map { |book| Book.new(book['id'], book['title']) }
  end


  def self.create(options)
    Book.switch_database
    result = @connection.exec("INSERT INTO books (title) VALUES('#{options[:title]}') RETURNING id, title")
    Book.new(result.first['id'], result.first['title'])
  end


  def ==(other)
    @id == other.id
  end



  private

  def self.switch_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'Rate_My_Book_test')
    else
      @connection = PG.connect(dbname: 'Rate_My_Book')
      result = @connection.exec("INSERT INTO books (title) VALUES('#{options[:title]}') RETURNING id, title")
      Book.new(result.first['id'], result.first['title'])
    end
  end
end