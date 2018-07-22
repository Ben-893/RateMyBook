require 'pg'

class Book

def self.all

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'Rate_My_Book_test')
  else
    connection = PG.connect(dbname: 'Rate_My_Book')
  end

  result = connection.exec("SELECT * FROM books")
  result.map { |book| book['title'] }
  end


  def self.create(options)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'Rate_My_Book_test')
  else
    connection = PG.connect(dbname: 'Rate_My_Book')
  end

  connection.exec("INSERT INTO books (title) VALUES('#{options[:title]}')")
  end
end