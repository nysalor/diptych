if development?
  require 'sinatra/reloader'
end

get '/' do
  @title = 'diptych - TOP'
  haml :index
end
