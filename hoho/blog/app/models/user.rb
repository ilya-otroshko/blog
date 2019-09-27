class User < ApplicationRecord
  has_secure_password
  
  mount_uploader :image, DocumentUploader

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def self.find_or_create_from_auth_hash(auth_hash)
    return nil if auth_hash.nil?
    user = User.new(provider: auth_hash.provider, uid: auth_hash.uid)
    if auth_hash.provider == 'linkedin'
      user.update(
          login: auth_hash.info.first_name,
          email: auth_hash.info.email
      )
    end
  end
end
