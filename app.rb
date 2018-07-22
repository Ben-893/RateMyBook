require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require 'book.rb'

class RateMyBook < Sinatra::Base
  register Sinatra::Flash
  enable :sessions


  get '/books' do
    @books = Book.all
    erb :index
  end




    run! if app_file == $0
end