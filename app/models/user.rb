class User < ActiveRecord::Base

  # Devise setup
  #
  devise :token_authenticatable,
         :database_authenticatable,
         :registerable, :recoverable, 
         :rememberable, :validatable,
         :trackable

  self.token_authentication_key = 'oauth_token'

  def self.find_for_token_authentication(conditions)
    AccessGrant.where(:access_token => conditions[token_authentication_key]).includes(:user).first.try(:user)
  end

  # Associations
  #
  has_many :access_grants


  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :first_name,
                  :last_name

  def as_json(options=nil)
    super(options.merge(:only => [:id, :email, :first_name, :last_name]))
  end

  def name
    "#{first_name} #{last_name}"
  end

  protected

  # allows user to change profile without providing a password (but checks if
  # new account does require a password, or if any password field is filled
  # in)
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
