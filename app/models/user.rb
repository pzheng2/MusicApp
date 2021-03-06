class User < ActiveRecord::Base
  validates :email, uniqueness: true
  # validates :email, :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    self.session_token = SecureRandom::urlsafe_base64
    save!
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.find_by_token(token)
    user = User.find_by_session_token(token)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
