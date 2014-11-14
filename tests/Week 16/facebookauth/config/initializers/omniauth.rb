OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '742417759147060', '8415a9e964526075b822925ba25c5028', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
