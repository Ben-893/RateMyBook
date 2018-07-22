require 'pg'

class Book

  def self.all
    Book.switch_database
    result = @connection.exec("SELECT * FROM books")
    result.map { |book| book['title'] }
  end


  def self.create(options)
    Book.switch_database
    @connection.exec("INSERT INTO books (title) VALUES('#{options[:title]}')")
  end


  def self.switch_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'Rate_My_Book_test')
    else
      @connection = PG.connect(dbname: 'Rate_My_Book')
    end
  end
end