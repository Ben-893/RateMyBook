require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/book'
require './lib/user'

class RateMyBook < Sinatra::Base
  set :public_folder, proc { File.join(root, 'public') }
  register Sinatra::Flash
  set :method_override, true
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    if @user
      redirect '/books'
    else
      redirect 'users/new'
    end
  end

  get '/books' do
    @user = User.find(session[:user_id])
    if @user
      @books = Book.all
      erb :index
    else
      redirect '/users/new'
    end
  end

  get '/books/new' do
    erb :"books/new"
  end

  post '/books' do
    Book.create(title: params['title'], author: params['author'], rating: params['rating'] )
    redirect '/books'
  end

  delete '/books/:id' do
    Book.delete(params['id'])
    redirect '/books'
  end

  get '/books/:id/edit' do
    @book = Book.find(params['id'])
    erb :"books/edit"
  end

  patch '/books/:id' do
    Book.update(params['id'], params['title'], params['author'], params['rating'] )
    redirect('/books')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect('/books')
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/bookmarks')
  end

    run! if app_file == $0
end