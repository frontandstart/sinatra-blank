require 'sinatra'
require_relative './app'
configure { set :server, :puma }
run App