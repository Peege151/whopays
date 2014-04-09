class GamesController < ApplicationController
	  def new
		@game = Game.new(params[:game])
	  end

	  def create
		@pool = Pool.find_by(params[:id])
		@game = current_user.games.build(game_params)
	  end

	  def create
    	@game = current_user.games.build(game_params)
      if @game.save
        flash[:success] = "Game Created! Good Work!"
        render 'static_pages/home'
      else
        render 'static_pages/home'
      end
  
  	private

       def game_params
      	params.require(:game)
       end
  end
end