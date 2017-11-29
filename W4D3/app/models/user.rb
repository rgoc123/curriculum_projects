class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  
  has_many :cats,
  class_name: 'Cat',
  foreign_key: :user_id,
  primary_key: :id
  
  has_many :requests,
    class_name: 'CatRentalRequest',
    foreign_key: :user_id
  
  attr_reader :password
  
  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end 
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
