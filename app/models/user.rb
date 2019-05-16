class User < ActiveRecord::Base
    has_many :authorizations
    validates :name, :email, :presence => true
  
    # save new user info
    def self.create_with_omniauth info
        create!(name: info['name'], email: info['email'])
    end

    # is user registered?  
    def self.exists? info
        !!(User.find_with_omniauth(info))
    end

  # recover user info  
    def self.find_with_omniauth info
        User.find_by(name: info['name'], email: info['email'])
    end
  
  # create new authorization associated with this user
    def add_provider auth
    #:user => self, :provider => auth['provider'], :uid => auth['uid']
        self.authorizations.create_with_omniauth auth 
    end
end
