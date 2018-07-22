require 'pg'

def setup_test_database!

  p "Setting up test database..."

  connection = PG.connect(dbname: 'Rate_My_Book_test')


  connection.exec("TRUNCATE books;")

end