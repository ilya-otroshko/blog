Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['facebook_key'], ENV['facebook_secret']

    OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

  end
