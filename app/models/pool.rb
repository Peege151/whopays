class Pool < ActiveRecord::Base
attr_accessible :name
has_many :games
has_many :users,
			through: :games
		
end
