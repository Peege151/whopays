class Game < ActiveRecord::Base
belongs_to :user
belongs_to :pool
validates :pool, :uniqueness => { :scope => :user_id }

end
