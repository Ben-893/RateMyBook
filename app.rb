require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/book'
require './lib/user'
require_relative 'controllers/books_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/application_controller'

class RateMyBook < Sinatra::Base
  set :public_folder, proc { File.join(root, 'public') }
  set :views, proc { File.join(root, '..', 'views') }
  register Sinatra::Flash
  set :method_override, true
  enable :sessions

  run! if app_file == $0
end