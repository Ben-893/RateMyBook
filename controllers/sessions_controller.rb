class RateMyBook < Sinatra::Base
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/books')
    else
      flash[:notice] = 'Incorrect email or password combination. Please check your email or password and try again'
      redirect('/sessions/new')
    end
  end
  get '/logout' do
    session.clear
    redirect '/'
  end
end