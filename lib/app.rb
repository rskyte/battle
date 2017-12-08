require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    @message = session[:message]
    @game_over_message = session[:game_over]
    @game = $game
    erb(:play)
  end

  post '/attack' do
    @game = $game
    attack_process = Proc.new do |first_p, second_p|
      session[:message] = "#{first_p.name} has attacked #{second_p.name}!"
      @game.attack(second_p)
    end
    params[:attack] == @game.player1.name ? attack_process.call(@game.player1, @game.player2) : attack_process.call(@game.player2, @game.player1)
    session[:game_over] = "#{@game.game_over.name} Loses!" if @game.game_over
    redirect '/play'
  end

  run! if app_file == $0
end
