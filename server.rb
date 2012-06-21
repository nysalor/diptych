if development?
  require 'sinatra/reloader'
end

get '/' do
  @title = 'diptych - TOP'
  haml :index
end

post '/add' do
  @url = params[:url]
  haml :index
end
