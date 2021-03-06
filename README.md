# RateMyBook

<a href="https://codeclimate.com/github/Ben-893/RateMyBook/maintainability"><img src="https://api.codeclimate.com/v1/badges/5cb1adcbfc397e561c4a/maintainability" /></a>

This is a web application that stores a list of books I like, and allows me to rate, edit and delete them.

## To Setup
```
git clone https://github.com/Ben-893/RateMyBook.git && cd RateMyBook
bundle
```
## To Setup Local Database
```
$ psql
$ CREATE DATABASE Rate_My_Book_test
$ CREATE DATABASE Rate_My_Book
$ \q
```

## To run
```
rackup
visit the site at http://localhost:9292
```



![alt text](Screenshot%202018-12-31%20at%2014.23.33.png)

# Specifications

I can visit RateMyBook which asks me to sign up or log in.

I can log out from anywhere in my application.

When I log in I can see a list of my books that show title, author and, my rating.

I can add one of my books with a title, author, and my rating.

I can update the rating or title or author of one of my books.

I can remove a book.
