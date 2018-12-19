require 'pg'

class Book
  attr_reader :id, :title, :author, :rating

  def initialize(id, title, author, rating)
    @id = id
    @author = author
    @title = title
    @rating = rating.to_i
  end



  def self.all
    Book.switch_database
    result = @connection.exec("SELECT * FROM books")
    result.map { |book| Book.new(book['id'], book['title'], book['author'], book['rating']) }
  end


  def self.create(options)
    Book.switch_database
    result = @connection.exec("INSERT INTO books (title, author, rating) VALUES('#{options[:title]}', '#{options[:author]}', '#{options[:rating]}') RETURNING id, title, author, rating")
    Book.new(result.first['id'], result.first['title'], result.first['author'], result.first['rating'])
  end


  def ==(other)
    @id == other.id
  end


  def self.delete(id)
    @connection.exec("DELETE FROM books WHERE id = #{id}")
  end

  def self.update(id, title, author, rating)
    Book.switch_database
    @connection.exec("UPDATE books SET title ='#{title}', author ='#{author}', rating ='#{rating}' WHERE id ='#{id}' RETURNING id, title, author, rating;")
  end

  def self.find(id)
    Book.switch_database
    result = @connection.exec("SELECT * FROM books WHERE id = #{id}")
    result.map { |book| Book.new(book['id'], book['title'], book['author'], book['rating']) }.first
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