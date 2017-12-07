require 'sinatra/base'
require_relative 'player'

class Battle < Sinatra::Base
  enable :sessions
  #set :session_secret, 'sesh'
  STARTING_HP = 60

  get '/' do
    erb(:index)
  end

  get '/play' do
    @message = session[:message]
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    @player_1_HP = $player1.hp
    @player_2_HP = $player2.hp
    erb(:play)
  end

  post '/attack1' do
    session[:message] = "#{$player1.name} has attacked #{$player2.name}!"
    $player2.reduce_hp(10)
    redirect '/play'
  end

  post '/attack2' do
    session[:message] = "#{$player2.name} has attacked #{$player1.name}!"
    $player1.reduce_hp(10)
    redirect '/play'
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  run! if app_file == $0
end
