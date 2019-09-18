class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  mount_uploader :image, DocumentUploader
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :liketable, dependent: :destroy
  validates :body, presence: true 
  
end