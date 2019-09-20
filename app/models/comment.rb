class Comment < ActiveRecord::Base
  mount_uploader :image, DocumentUploader

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :liketable, dependent: :destroy

  validates :body, presence: true 
  
end