class RateMyBook < Sinatra::Base
  get '/' do
    @user = User.find(session[:user_id])
    if @user
      redirect '/books'
    else
      erb :index
    end
  end
end