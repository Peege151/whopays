class GamesController < ApplicationController
    before_filter :set_game, only: [:show, :edit, :update, :destroy]


    def new
		  @game = Game.new(params[:game])
		  @pool = Pool.where(:id => params[:pool_id])
	  end



	  def create
    	@game = current_user.games.build(pool_id: params[:pool_id])# :conditions => ["user_id != ?", current_user.id, "pool_id !=?", pool_id]
      if @game.save
        redirect_to  @game.pool, :flash => { :success => "Pool Joined Successfully." }         
      else
        flash[:error] = "You're Already In The Pool (Or Something Weird Happened...)"
        redirect_to @game.pool
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