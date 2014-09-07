class User < ActiveRecord::Base
  enum role: [:user, :breeder, :vet, :sitter, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :photos
  has_many :pets

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  def self.from_omniauth(auth)
    logger.debug "from_omniauth"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.uid = auth.uid
      user.provider = auth.provider
      user.token = auth.credentials.token
      user.skip_confirmation!
    end
  end
  
  def self.new_with_session(params, session)
    logger.debug "new_with_session"
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["first_name"]
        user.last_name = data["last_name"]
      end
    end
  end
end
