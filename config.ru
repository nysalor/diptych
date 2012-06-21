require 'rubygems'
require 'sinatra'
require 'haml'
require 'sequel'
require 'sqlite3'
require 'sanitize'

require './server.rb'

run Sinatra::Application
