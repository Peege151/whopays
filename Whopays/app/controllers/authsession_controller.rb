class SessionsController < Devise::SessionsController

	

	def venmo
		@user = User.find_for_oauth(env["omniauth.auth"], current_user)
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "Venmo") if is_navigational_format?
		else
			session["devise.venmo_uid"] = env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

	






	protected

	def auth_hash
		request.env['omniauth.auth']
	end	






end