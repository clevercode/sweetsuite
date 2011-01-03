class AccessGrant < ActiveRecord::Base
  
  # Associations
  #
  belongs_to :user
  belongs_to :application

  # Callbacks
  #
  before_create :generate_tokens

  def generate_tokens
    self.code, self.access_token, self.refresh_token =
    SecureRandom.hex(16), SecureRandom.hex(16), SecureRandom.hex(16)
  end

  # Instance Methods
  #
  def redirect_uri_for(redirect_uri)
    prefix = redirect_uri =~ /\?/ ? '&' : '?' #Check for existing query string
    "#{redirect_uri}#{prefix}code=#{code}&response_type=code"
  end

  def start_expiry_period!
    self.update_attribute(:expires_at, 1.week.from_now)
  end


  class << self 

    def authenticate(code, application)
      where(:code => code, :application_id => application.to_param).first
    end
    
  end

end
