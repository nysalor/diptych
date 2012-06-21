require 'rubygems'
require 'sinatra'
require './server.rb'

if development?
  require 'sinatra/reloader'
end

run Sinatra::Application
