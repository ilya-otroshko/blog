class User < ApplicationRecord
  has_secure_password
  has_many :comments, as: :commentable
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40}
end
