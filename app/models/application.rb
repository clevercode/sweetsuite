require 'digest/sha1'
class Application < ActiveRecord::Base

  has_many :access_grants
  has_many :users, :through => :access_grants

  attr_accessible :name, :slug, :callback_url 

  before_create :generate_client_id!
  before_create :generate_client_secret!

  def self.authenticate(client_id, client_secret)
    where(:client_id => client_id, :client_secret => client_secret).first
  end

  def make_inferences
    self.slug = self.name.parameterize
    self.url = 'http://%s.sweetsuite.dev' % self.slug
  end

  def generate_client_id!
    self.client_id = generate_token(self.name)
  end

  def generate_client_secret!
    self.client_secret = generate_token(self.name, Time.now.to_f, 5.times.map { ('A'..'Z').to_a.sample }.join)
  end

  def generate_token(*parts)
    Digest::SHA1.hexdigest(parts.push('sodium chloride').join('---'))
  end

end
