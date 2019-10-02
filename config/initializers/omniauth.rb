Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],{ token_params: { parse: :json } }
  end
