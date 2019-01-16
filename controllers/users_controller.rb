class RateMyBook < Sinatra::Base
  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect('/books')
    else
      flash[:notice] = 'This user already exists.'
      redirect('/users/new')
    end
  end
end