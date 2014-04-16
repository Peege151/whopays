class Identity < ActiveRecord::Base
  
  # Setting up authentication for Venmo

  belongs_to :user
  validates_presence_of :user_id, :uid, :provider validates_presence_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
  	identity = find_by(provider: auth.provider, uid: auth.uid)
  		if identity.nil?
  			create(uid: auth.uid, provider: auth.provider)
  		end
  		identity
  	end	
  end

end
