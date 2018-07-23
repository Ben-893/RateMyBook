require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/book.rb'


class RateMyBook < Sinatra::Base
  register Sinatra::Flash
  enable :sessions


  get '/books' do
    @books = Book.all
    erb :index
  end

  get '/books/new' do
    erb :"books/new"
  end

  post '/books' do
    Book.create(title: params['title'], author: params['author'])
    redirect '/books'
  end

  post '/books/:id' do
    Book.delete(params['id'])
    redirect '/books'
  end



    run! if app_file == $0
end