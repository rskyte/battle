require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    Game.create_game(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/lose' do
    @game_over_message = session[:game_over]
    erb(:lose)
  end

  before do
    @game = Game.get_game
  end

  get '/play' do
    @message = session[:message]
    erb(:play)
  end

  post '/attack' do
    attack_process = Proc.new do |first_p, second_p|
      session[:message] = "#{first_p.name} has attacked #{second_p.name}!"
      @game.attack(second_p)
    end
    params[:attack] == @game.player1.name ? attack_process.call(@game.player1, @game.player2) : attack_process.call(@game.player2, @game.player1)
    if @game.game_over
      session[:game_over] = "#{@game.game_over.name} Loses!"
      redirect '/lose'
    end
    redirect '/play'
  end

  run! if app_file == $0
end
