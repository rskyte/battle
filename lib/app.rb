require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'sesh'
  STARTING_HP = 60
  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @player_1_HP = STARTING_HP
    @player_2_HP = STARTING_HP
    erb(:play)
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  run! if app_file == $0
end
