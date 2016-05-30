OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1773350696233185', 'ef8d593ba80b71bbe1184ef8743333cd'
end
