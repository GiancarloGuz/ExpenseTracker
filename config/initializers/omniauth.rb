Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "595821335317-60adincjlkiskkfafgb46qf20rdmfrhj.apps.googleusercontent.com", "-r8qY1pOA-4Gev8iQV8vxPCx", 
    {
      name: "google",
      scope: "email, profile, plus.me, http://gdata.youtube.com",
      prompt: "select_account",
      image_aspect_ratio: "square",
      image_size: 50
    }
end