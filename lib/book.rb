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
end