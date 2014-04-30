class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def venmo 
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user) 
    if @user.persisted? 
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated 
      set_flash_message(:success, :success, :kind => "Venmo") if is_navigational_format? 
    else 
      redirect_to new_user_registration_url
    end
  end  


 # def twitter
 #    @user = User.find_for_oauth(env["omniauth.auth"], current_user)
 #    if @user.persisted?
 #      sign_in_and_redirect @user, :event => :authentication
 #      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
 #    else
 #      session["devise.twitter_uid"] = env["omniauth.auth"]
 #      redirect_to new_user_registration_url
 #    end
 #  end

  # def facebook
  #   @user = User.find_for_oauth(env["omniauth.auth"], current_user)
  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end




end