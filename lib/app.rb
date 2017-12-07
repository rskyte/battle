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

  post '/attack' do
    attack_process = Proc.new do |first_p, second_p|
      session[:message] = "#{first_p.name} has attacked #{second_p.name}!"
      second_p.reduce_hp(10)
    end
    params[:attack] == $player1.name ? attack_process.call($player1, $player2) : attack_process.call($player2, $player1)
    redirect '/play'
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  run! if app_file == $0
end
