Rails.application.config.middleware.use OmniAuth::Builder do
  provider :venmo, '1690', 'JDTMLUjUnWGGBprhKjEDY6LVZufSh5fb', :scope => 'access_feed,access_profile,access_friends,make_payments'
end