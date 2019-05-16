OmniAuth.config.logger = Rails.logger



Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer if Rails.env.development?
    provider :github, 'a878e1e2f205357fdc8e', 'aaec9a10fc461a86d8701f2d7bbfa62730811afd'
            { :name => "github", :scope => ['read:user', 'user:email']}
    provider :facebook, '426919038065902', '8d978b229bd289452517e8f5ec44d05a' 
    #provider :nnn, 'api_key', 'api_secret'
    #provider :twitter,
    #provider :facebook,
    #provider :google_oauth2,
    #provider :linkedin,

end