class Pool < ActiveRecord::Base
has_many :users
has_many :games,
			through: :users
		
end
