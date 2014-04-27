class Game < ActiveRecord::Base
attr_accessible :pool_id, :user_id
belongs_to :user
belongs_to :pool
validates :pool, uniqueness: {scope: :user_id}



end
