require 'pg'

def setup_test_database!



  connection = PG.connect(dbname: 'Rate_My_Book_test')


  connection.exec("TRUNCATE books;")
  connection.exec("TRUNCATE users;")

end