Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],{:provider_ignores_state => true}
  end
