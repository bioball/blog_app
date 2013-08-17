Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      '275541022586611', '71b65e7353a784249c9905bcaecbd891'
  provider :google_oauth2, '129918030327.apps.googleusercontent.com',   'c6WeHuKsJokxohfikjh-JaA2'
end