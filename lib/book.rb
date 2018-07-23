require 'pg'

class Book
  attr_reader :id, :title, :author

  def initialize(id, title, author)
    @id  = id
    @author = author
    @title = title
  end



  def self.all
    Book.switch_database
    result = @connection.exec("SELECT * FROM books")
    result.map { |book| Book.new(book['id'], book['title'], book['author']) }
  end


  def self.create(options)
    Book.switch_database
    result = @connection.exec("INSERT INTO books (title, author) VALUES('#{options[:title]}', '#{options[:author]}') RETURNING id, title, author")
    Book.new(result.first['id'], result.first['title'], result.first['author'])
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
      result = @connection.exec("INSERT INTO books (title) VALUES('#{options[:title]}', '#{options[:author]}') RETURNING id, title, author")
    Book.new(result.first['id'], result.first['title'], book['author'])
    end
  end
end