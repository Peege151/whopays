class Game < ActiveRecord::Base
attr_accessible :game_id, :pool_id, :user_id
belongs_to :user
belongs_to :pool
validates :pool_id, :uniqueness => {:scope => :user_id}



end
