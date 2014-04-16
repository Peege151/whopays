Rails.application.config.middleware.use OmniAuth::Builder do
  provider :venmo, '1691', 'BMHwgUQkcBMTEJSKpbKYyRBg5pktZH7L',#,{:client_options => {:ssl => {:verify => false}}},
 :scope => 'access_feed,access_profile,access_friends,make_payments'
end