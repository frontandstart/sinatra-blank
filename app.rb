require 'sinatra/base'
require 'sinatra/json'
require 'puma'
require 'haml'
require_relative 'db'

configure { set :server, :puma }

class App < Sinatra::Base

  get '/' do
    haml :start
  end

end

