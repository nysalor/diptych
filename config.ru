require 'rubygems'
require 'sinatra'
require 'haml'
require 'sequel'
require 'sqlite3'

require './server.rb'

run Sinatra::Application
