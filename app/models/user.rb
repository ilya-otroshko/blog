class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password
  
  mount_uploader :image, DocumentUploader

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true

def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  def self.find_or_create_from_auth_hash(auth_hash)
    return nil if auth_hash.nil?
    user = User.where(provider: auth_hash.provider, uid: auth_hash.uid).first
    user = User.new(provider: auth_hash.provider, uid: auth_hash.uid) if user.nil?
    if auth_hash.provider == 'facebook'
      user.update(
          login: user.login || auth_hash.info.name.split(' ')[0],
          email: auth_hash.uid + auth_hash.provider + '@gmail.com',
          password: auth_hash.provider + auth_hash.uid + auth_hash.info.name.upcase,
          password_confirmation: auth_hash.provider + auth_hash.uid + auth_hash.info.name.upcase,
          remote_image_url: auth_hash.info.image + "?height=300&width=300"
      )
    elsif auth_hash.provider == 'linkedin'
      user.update(
          name: user.name || auth_hash.info.first_name,
          surname: user.surname || auth_hash.info.last_name,
          email: auth_hash.uid + auth_hash.provider + '@gmail.com',
          password: auth_hash.provider + auth_hash.uid + auth_hash.info.first_name.upcase + '1',
          password_confirmation: auth_hash.provider + auth_hash.uid + auth_hash.info.first_name.upcase + '1',
          remote_image_url: Faker::Avatar.image
      )
    end
    user.update(email_confirmed: true)
    user
  end
  
  private
def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
