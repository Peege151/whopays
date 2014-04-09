class GamesController < ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy]


    def new
		@game = Game.new(params[:game])
		@pool = Pool.where(:id => params[:pool_id])

	  end



	  def create
	  	@pool = Pool.find_by(params[:id])
    	@game = current_user.games.build(pool_id: params[:pool_id])# :conditions => ["user_id != ?", current_user.id, "pool_id !=?", pool_id]
      if @game.save
        flash[:success] = "Game Created! Good Work!"
        redirect_to  @game.pool 
        
      else
        flash[:fail] = "Something Happened..."
        render 'static_pages/home'
      end
    end

    def destroy
    		  @game.destroy
    		  respond_to do |format|
      		format.html { redirect_to pools_url }
      		format.json { head :no_content }
    		end
  	end
  
  	# private

       def game_params
      	params.require(:game).permit(:user_id, :pool_id)
       end

      def set_game
        @game = Game.find(params[:id])
      end    
end