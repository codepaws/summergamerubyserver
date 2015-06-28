require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

require_relative 'init.rb'

set :server, :puma
set :port, 80
set :bind, '0.0.0.0'
set :public_folder, 'public/'
set :views, 'views/'

require_relative 'routes/init.rb'