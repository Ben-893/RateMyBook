require 'pg'

class Book

def self.all

    connection = PG.connect(dbname: 'Rate_My_Book')
    result = connection.exec("SELECT * FROM books")
    result.map { |book| book['title'] }

  end
end