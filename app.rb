require 'sinatra/base'
require 'sinatra/flash'
require 'uri'

class RateMyBook < Sinatra::Base
  register Sinatra::Flash
  enable :sessions


  get '/' do
    'Hello World'
  end




    run! if app_file == $0
end