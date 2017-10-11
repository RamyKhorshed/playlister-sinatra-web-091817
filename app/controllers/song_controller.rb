class SongController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :showsongs
  end

  get '/songs/:id' do
    binding.pry
    @song = Song.find(params[:id])
    erb :show
  end
end
