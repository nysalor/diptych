if development?
  require 'sinatra/reloader'
end

Sequel::Model.plugin(:schema)

Sequel.sqlite('db/diptych.db')
class Entries < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      string :url
    end
    create_table
  end
end

get '/' do
  @title = 'diptych - TOP'
  @entries = Entries.all
  haml :index
end

post '/add' do
  @url = params[:url]
  Entries.insert :url => @url
  redirect '/'
end
