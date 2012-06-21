if development?
  require 'sinatra/reloader'
end

Sequel::Model.plugin(:schema)

Sequel.sqlite('db/diptych.db')
class Entries < Sequel::Model
  plugin :timestamps, :update_on_create => true
  unless table_exists?
    set_schema do
      primary_key :id
      string :url
      timestamp :created_at
      timestamp :updated_at
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
  @entry = Entries.new :url => Sanitize.clean(params[:url])
  @entry.save
  redirect '/'
end

helpers do
  def add_schema(url)
    if url !~ /^https?/
      if url =~ /\/\//
        "http:#{url}"
      else
        "http://#{url}"
      end
    else
      url
    end
  end

  def shorten(str, max = 20)
    if str.length > max
      "#{str[0..max.to_i]}..."
    else
      str
    end
  end

  def timefmt(time)
    if time
      time.strftime("%Y-%m-%d %H:%M:%S")
    else
      ''
    end
  end
end
