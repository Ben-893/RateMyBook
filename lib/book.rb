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


  def self.delete(id)
    @connection.exec("DELETE FROM books WHERE id = #{id}")
  end

  def self.update(id, title, author)
    Book.switch_database
    @connection.exec("UPDATE books SET title ='#{title}', author ='#{author}' WHERE id ='#{id}' RETURNING id, title, author;")
  end

  def self.find(id)
    Book.switch_database
    result = @connection.exec("SELECT * FROM books WHERE id = #{id}")
    result.map { |book| Book.new(book['id'], book['title'], book['author']) }.first
  end

  private

  def self.switch_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'Rate_My_Book_test')
    else
      @connection = PG.connect(dbname: 'Rate_My_Book')
    end
  end
end