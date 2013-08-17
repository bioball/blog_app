class User < ActiveRecord::Base
  has_many :blogs
  has_many :authentications
  before_save { email.downcase! }
  validates :name, presence: true
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def User.create_with_omniauth(auth)
      create! do |user|
        user.name = auth["info"]["name"]
        user.email = auth["info"]["email"]
        user.uid = auth["uid"]
        user.provider = auth["provider"]
        user.password = auth["provider"]
        user.password_confirmation = auth["provider"]
      end
    end
end
