class Application < ActiveRecord::Base

  has_many :access_tokens
  has_many :users, :through => :access_tokens

  attr_accessible :name, :slug, :callback_url 

  def self.authenticate(client_id, client_secret)
    where(:client_id => client_id, :client_secret => client_secret).first
  end

end
