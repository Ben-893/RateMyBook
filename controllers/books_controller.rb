class RateMyBook < Sinatra::Base

  get '/books' do
    @user = User.find(session[:user_id])
    if @user
      @books = Book.all
      erb :"books/index"
    else
      redirect '/'
    end
  end

  get '/books/new' do
    @user = User.find(session[:user_id])
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
    @user = User.find(session[:user_id])
    @book = Book.find(params['id'])
    erb :"books/edit"
  end

  patch '/books/:id' do
    Book.update(params['id'], params['title'], params['author'], params['rating'] )
    redirect('/books')
  end
end