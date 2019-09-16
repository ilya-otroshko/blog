class User < ApplicationRecord
  has_secure_password
  mount_uploader :document, DocumentUploader
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40}


end
