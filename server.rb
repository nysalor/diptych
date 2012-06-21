if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end
